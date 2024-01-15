import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class MentionInput<T> extends ConsumerStatefulWidget {
  final List<T> suggestions;
  final String Function(T) displayField;
  final Widget Function(T) renderSuggestion;
  final void Function(String) onChange;

  MentionInput({
    required this.suggestions,
    required this.displayField,
    required this.renderSuggestion,
    required this.onChange,
  });

  @override
  _MentionInputState<T> createState() => _MentionInputState<T>();
}

class _MentionInputState<T> extends BaseConsumerState<MentionInput<T>> {
  TextEditingController _controller = TextEditingController();
  bool showSuggestions = false;
  List<T> filteredSuggestions = [];
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderTextField(
                name: 'comment',
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    print(value.toString());
                    showSuggestions =
                        value!.isNotEmpty && value.startsWith('@');
                    filteredSuggestions = _filterSuggestions(value);
                  });
                  print("filteredSuggestions----" +
                      filteredSuggestions.toString());
                  widget.onChange(value!);
                },
                onSubmitted: (text) {
                  setState(() {});
                },
                validator: (val) {},
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  hintText: "Add comment",
                  hintStyle: TextStyle(
                    color: Helper.textColor500,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/images/send.svg'),
                      onPressed: () async {
                        setState(() {
                          // _controller.clear();
                          // _changeState = false;
                        });
                        Map<String, dynamic> data = {
                          "comment": _controller.text,
                        };
                        if (_fbKey.currentState!.saveAndValidate()) {
                          // print("id passed" + widget.progresslineId.toString());
                          // await ref
                          //     .watch(postCommentProvider.notifier)
                          //     .postComment(widget.progresslineId, data)
                          //     .then((value) async {
                          //   value.fold((failure) {
                          //     print("errorrrrrr");
                          //   }, (res) {
                          //     ref
                          //         .watch(commentsControllerProvider.notifier)
                          //         .getComments(widget.progresslineId);
                          //     print("response data" + res.toString());
                          //     _controller.clear();
                          //     // _showProgressBottomSheet(context, ref);
                          //   });
                          //   Utils.toastSuccessMessage("Comment Posted");
                          // });
                        }
                      },
                    ),
                  ),
                  // hintText: widget.control.label,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Helper.textColor300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(color: ref.watch(primaryColorProvider)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                onTap: () {},
              ),
              if (showSuggestions)
                Positioned(
                  top: MediaQuery.of(context)
                      .viewInsets
                      .bottom, // Adjust this value based on your UI design
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: filteredSuggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            widget.onChange(
                              '@${widget.displayField(filteredSuggestions[index])} ',
                            );
                            setState(() {
                              showSuggestions = false;
                              _controller.clear();
                            });
                          },
                          title: widget
                              .renderSuggestion(filteredSuggestions[index]),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  List<T> _filterSuggestions(String query) {
    final lowerCaseQuery = query.toLowerCase().replaceAll('@', '');
    final filteredList = widget.suggestions.where((suggestion) {
      final suggestionText = widget.displayField(suggestion).toLowerCase();
      return suggestionText.contains(lowerCaseQuery);
    }).toList();

    print('Query: $query');
    print('Filtered List: $filteredList');

    return filteredList;
  }
}
