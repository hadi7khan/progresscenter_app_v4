import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class ChatInputWidget extends ConsumerStatefulWidget {
  final Function onChange;
  const ChatInputWidget({super.key, required this.onChange});

  @override
  ConsumerState<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends BaseConsumerState<ChatInputWidget> {
  Map<String, dynamic>? user;
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() {
    user = _prefsLocator.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        color: Colors.white,
        alignment: Alignment.center,
        height: 72.h,
        child: ListTile(
          horizontalTitleGap: 8.w,
          contentPadding: EdgeInsets.zero,
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: 0),
          leading: AvatarWidget(
            dpUrl: user!['dpUrl'] != null ? user!['dpUrl'] : "",
            name: user!['name'],
            backgroundColor: user!['preset']['color'],
            size: 32,
            fontSize: 14,
          ),
          title: FormBuilderTextField(
            name: 'support',
            controller: _controller,
            onChanged: (value) {},
            onSubmitted: (text) {},
            validator: (val) {},
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
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              hintText: "Type message here...",
              hintStyle: TextStyle(
                letterSpacing: -0.3,
                color: Helper.textColor500,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/send.svg'),
                  onPressed: () async {
                    setState(() {});
                    Map<String, dynamic> data = {
                      "message": _controller.text,
                    };
                    if (_controller.text.isNotEmpty) {
                      widget.onChange(data);
                      _controller.clear();
                    }
                  },
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Helper.textColor300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: ref.watch(primaryColorProvider)),
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
      ),
    );
  }
}
