import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_lean_model.dart';

final projectHierarchyProvider = Provider<ProjectHierarchySelection>((ref) {
  // Initialize your ProjectHierarchySelection instance here
  return ProjectHierarchySelection(
    projects: [], // Add your projects here
    selectedIds: [],
    onSelectedIdsChange: (ids) {
      // Handle selected IDs change if needed
    },
  );
});

class ProjectHierarchySelection {
  List<ProjectLeanModel> projects = [];
  List<String> selectedIds;
  final Function(List<String>)? onSelectedIdsChange;

  ProjectHierarchySelection({
    required this.projects,
    this.selectedIds = const [],
    this.onSelectedIdsChange,
  });

  Map<String, List<ProjectLeanModel>> get projectChildrenMap {
    return projects.fold({}, (acc, cur) {
      if (cur.parentId == null) {
        acc['root'] = acc['root'] ?? [];
        acc['root']!.add(cur);
      } else {
        acc[cur.parentId!] = acc[cur.parentId] ?? [];
        acc[cur.parentId]!.add(cur);
      }
      return acc;
    });
  }

  Set<String> addParentId(Set<String> ids, String parentId) {
    final parent = projects.firstWhere((p) => p.projectId == parentId);
    ids.add(parent.projectId);

    if (parent.parentId != null) {
      addParentId(ids, parent.parentId!);
    }

    return ids;
  }

  void removeParentId(Set<String> ids, String parentId) {
    final parent = projects.firstWhere((p) => p.projectId == parentId);
    final children = getChildren(parent.projectId);
    final childrenIds = children.map((child) => child.projectId).toList();
    final isAnotherChildSelected = ids.any((id) => childrenIds.contains(id));

    if (!isAnotherChildSelected) {
      ids.remove(parent.projectId);

      if (parent.parentId != null) {
        removeParentId(ids, parent.parentId!);
      }
    }
  }

  void addChildrenIds(Set<String> ids, List<ProjectLeanModel> children) {
    children.forEach((child) {
      ids.add(child.projectId);

      if (hasChildren(child.projectId)) {
        addChildrenIds(ids, getChildren(child.projectId!));
      }
    });
  }

  void removeChildrenIds(Set<String> ids, List<ProjectLeanModel> children) {
    children.forEach((child) {
      ids.remove(child.projectId);

      if (hasChildren(child.projectId)) {
        removeChildrenIds(ids, getChildren(child.projectId));
      }
    });
  }

  List<ProjectLeanModel> getChildren(String projectId) {
    return projectChildrenMap[projectId] ?? [];
  }

  bool hasChildren(String projectId) {
    return projectChildrenMap.containsKey(projectId);
  }

  bool isSelected(String projectId) {
    return selectedIds.contains(projectId);
  }

  List<String> changeSelected(ProjectLeanModel project, bool isChecked) {
    final _selectedProjectIds = Set<String>.from(selectedIds);
    final projectId = project.projectId;

    if (isChecked) {
      // Add project id to the selected list
      _selectedProjectIds.add(projectId);

      if (project.parentId != null) {
        addParentId(_selectedProjectIds, project.parentId!);
      }

      if (hasChildren(project.projectId)) {
        addChildrenIds(_selectedProjectIds, getChildren(project.projectId));
      }
    } else {
      // Delete project id from the selected list
      _selectedProjectIds.remove(projectId);

      if (project.parentId != null) {
        removeParentId(_selectedProjectIds, project.parentId!);
      }

      if (hasChildren(project.projectId)) {
        removeChildrenIds(_selectedProjectIds, getChildren(project.projectId));
      }
    }

    onSelectedIdsChange?.call(_selectedProjectIds.toList());
    // Update the selectedIds field with the new selected IDs
    selectedIds = _selectedProjectIds.toList();
    print("selected ids in class" + selectedIds.toString());
    // return selectedIds;
    return _selectedProjectIds.toList();
  }

  bool hasAllChildrenSelected(String projectId) {
    final allDescendants = <String>{};

    if (hasChildren(projectId)) {
      addChildrenIds(allDescendants, getChildren(projectId));
    }

    return allDescendants.every((id) => selectedIds.contains(id));
  }
}
