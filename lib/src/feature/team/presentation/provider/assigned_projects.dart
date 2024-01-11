import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

class ProjectHierarchySelection {
  List<ProjectModel> projects = [];
  List<String> selectedIds;
  final Function(List<String>)? onSelectedIdsChange;

  ProjectHierarchySelection({
    required this.projects,
    this.selectedIds = const [],
    this.onSelectedIdsChange,
  });

  Map<String, List<ProjectModel>> get projectChildrenMap {
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
    final parent = projects.firstWhere((p) => p.id == parentId);
    ids.add(parent.id!);

    if (parent.parentId != null) {
      addParentId(ids, parent.parentId!);
    }

    return ids;
  }

  void removeParentId(Set<String> ids, String parentId) {
    final parent = projects.firstWhere((p) => p.id == parentId);
    final children = getChildren(parent.id!);
    final childrenIds = children.map((child) => child.id).toList();
    final isAnotherChildSelected = ids.any((id) => childrenIds.contains(id));

    if (!isAnotherChildSelected) {
      ids.remove(parent.id);

      if (parent.parentId != null) {
        removeParentId(ids, parent.parentId!);
      }
    }
  }

  void addChildrenIds(Set<String> ids, List<ProjectModel> children) {
    children.forEach((child) {
      ids.add(child.id);

      if (hasChildren(child.id)) {
        addChildrenIds(ids, getChildren(child.id!));
      }
    });
  }

  void removeChildrenIds(Set<String> ids, List<ProjectModel> children) {
    children.forEach((child) {
      ids.remove(child.id);

      if (hasChildren(child.id)) {
        removeChildrenIds(ids, getChildren(child.id));
      }
    });
  }

  List<ProjectModel> getChildren(String projectId) {
    return projectChildrenMap[projectId] ?? [];
  }

  bool hasChildren(String projectId) {
    return projectChildrenMap.containsKey(projectId);
  }

  bool isSelected(String projectId) {
    return selectedIds.contains(projectId);
  }

  List<String> changeSelected(ProjectModel project, bool isChecked) {
    final _selectedProjectIds = Set<String>.from(selectedIds);
    final projectId = project.id;

    if (isChecked) {
      // Add project id to the selected list
      _selectedProjectIds.add(projectId);

      if (project.parentId != null) {
        addParentId(_selectedProjectIds, project.parentId!);
      }

      if (hasChildren(project.id)) {
        addChildrenIds(_selectedProjectIds, getChildren(project.id));
      }
    } else {
      // Delete project id from the selected list
      _selectedProjectIds.remove(projectId);

      if (project.parentId != null) {
        removeParentId(_selectedProjectIds, project.parentId!);
      }

      if (hasChildren(project.id)) {
        removeChildrenIds(_selectedProjectIds, getChildren(project.id));
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
