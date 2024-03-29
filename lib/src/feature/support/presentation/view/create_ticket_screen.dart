import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/create_ticket_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/support_controller.dart';

class CreateTicketScreen extends ConsumerStatefulWidget {
  const CreateTicketScreen({super.key});

  @override
  ConsumerState<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends BaseConsumerState<CreateTicketScreen> {
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  List<String> _topicList = ['Camera Issue', 'Dashboard Issue'];
  String _topicSelected = 'Camera Issue';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: AppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 12.0.w,
              leading: InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  'assets/images/close-x.svg',
                ),
              ),
              leadingWidth: 12,
              title: Text(
                "Create Ticket",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInputWidget(
                        title: "Help topic",
                        formField: FormBuilderDropdown(
                          name: "topic",
                          dropdownColor: Colors.white,
                          icon: SizedBox(),
                          initialValue: _topicList[0],
                          decoration: InputDecoration(
                            hintText: "Select a topic",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 14.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined,
                                      color: Helper.textColor500)
                                ],
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                  color: ref.watch(primaryColorProvider)),
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
                          onChanged: (value) {
                            setState(() {
                              _topicSelected = value!;
                            });
                          },
                          items: _topicList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(
                                    letterSpacing: -0.3, color: Colors.black),
                              ),
                              onTap: () {},
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomInputWidget(
                        title: "Subject",
                        formField: FormBuilderTextField(
                          name: 'subject',
                          controller: _subjectController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Subject is required';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            letterSpacing: -0.3,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            hintText: "Enter text here",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                  color: ref.watch(primaryColorProvider)),
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
                      ),
                      SizedBox(height: 12.h),
                      CustomInputWidget(
                        title: "Details",
                        formField: FormBuilderTextField(
                          name: 'details',
                          controller: _detailsController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Details are required';
                            }
                            return null;
                          },
                          minLines: 6,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            letterSpacing: -0.3,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            hintText:
                                "Enter details or reasons for opening ticket",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: widget.control.label,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                  color: ref.watch(primaryColorProvider)),
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
                      ),
                      SizedBox(height: 30.h),
                    ]),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          color: Colors.white,
          alignment: Alignment.center,
          height: 76.h,
          child: Container(
            height: 52.h,
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                "Create Ticket",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      _subjectController.text.isNotEmpty &&
                              _detailsController.text.isNotEmpty
                          ? ref.watch(primaryColorProvider)
                          : Helper.blendmode),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  )),
              onPressed: () async {
                Map<String, dynamic> data = {
                  "topic": _topicSelected,
                  "subject": _subjectController.text,
                  "detail": _detailsController.text,
                };
                if (_fbKey.currentState!.saveAndValidate() &&
                    _subjectController.text.isNotEmpty &&
                    _detailsController.text.isNotEmpty) {
                  setState(() {
                    _isLoading = true;
                  });
                  await ref
                      .watch(createTicketProvider.notifier)
                      .createTicket(data)
                      .then((value) async {
                    value.fold((failure) {}, (data) {
                      Utils.toastSuccessMessage("Ticket created", context);
                      ref
                          .watch(supportControllerProvider.notifier)
                          .getSupportTickets();
                      context.pop();
                      _subjectController.clear();
                      _detailsController.clear();
                    });

                    setState(() {
                      _isLoading = false;
                    });
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
