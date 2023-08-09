import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class FeedCard extends StatefulWidget {
  final progresslineData;
  const FeedCard({super.key, required this.progresslineData});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.width - (2 * 20)) / 1.5;
    print("card height" + height.toString());
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // height: 336.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Helper.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Wrap(
        // direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: AvatarWidget(
              dpUrl: widget.progresslineData.user.dpUrl != null
                  ? widget.progresslineData.user.dpUrl
                  : "",
              name: widget.progresslineData.user.name,
              backgroundColor: widget.progresslineData.user.preset.color,
              size: 24,
            ),
            title: Text(
              widget.progresslineData.user.name,
              style: TextStyle(
                  color: Helper.textColor900,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              "11 min ago",
              style: TextStyle(
                  color: Helper.textColor600,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Stack(
              fit: StackFit.loose,
              // alignment: Alignment.bottomCenter,
              children: [
                // widget.data.latestImage != null
                //     ?
                Positioned(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.network(
                          widget.progresslineData.url,
                          // height: 284.h,
                          fit: BoxFit.fill,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return ClipRRect(
                              child: Image.asset(
                                'assets/images/error_image.jpeg',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      )),
                ),
                // : ClipRRect(
                //     borderRadius: BorderRadius.circular(16.r),
                //     child: Image.asset(
                //       'assets/images/error_image.jpeg',
                //       fit: BoxFit.fill,
                //       height: 264.h,
                //     ),
                //   ),
                Container(
                    margin: EdgeInsets.only(top: height - 15),
                    // height: 88.h,
                    width: double.infinity,
                    // margin: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Color.fromRGBO(246, 246, 246, 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          horizontalTitleGap: 8.w,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            padding: EdgeInsets.all(4.w),
                            child: SvgPicture.asset('assets/images/eye.svg',
                            width: 24.w,
                            ),
                          ),
                          title: Text(
                            widget.progresslineData.viewedBy.length.toString(),
                            style: TextStyle(
                                color: Helper.textColor600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            widget.progresslineData.comments.length.toString() + " comments",
                            style: TextStyle(
                                color: Helper.primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          horizontalTitleGap: 8.w,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          leading: AvatarWidget(
                            dpUrl: "",
                            name: "HADI",
                            backgroundColor: "#0F9555",
                            size: 32,
                          ),
                          title: FormBuilderTextField(
                            name: 'project_name',
                            controller: _controller,
                            onChanged: (text) {
                              // setState(() {});
                              // _changeState = true;
                            },
                            onSubmitted: (text) {
                              setState(() {
                                // _changeState = true;
                              });
                            },
                            validator: (val) {
                              // if (_validate && val == null || val!.isEmpty) {
                              //   return 'Project name is required';
                              // }
                              // return null;
                            },
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 12.w),
                              hintText: "Add comment",
                              hintStyle: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      'assets/images/send.svg'),
                                  onPressed: () {
                                    setState(() {
                                      // _controller.clear();
                                      // _changeState = false;
                                    });
                                  },
                                ),
                              ),
                              // hintText: widget.control.label,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    BorderSide(color: Helper.textColor300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: Helper.primary),
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
                      ],
                    )),
              ]),
        ],
      ),
    );
  }
}
