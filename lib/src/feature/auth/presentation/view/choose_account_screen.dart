import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_site_gallery.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/client_accounts_controller.dart';
import 'dart:developer' as dev;

class ChooseAccountScreen extends ConsumerStatefulWidget {
  const ChooseAccountScreen({super.key});

  @override
  ConsumerState<ChooseAccountScreen> createState() =>
      _ChooseAccountScreenState();
}

class _ChooseAccountScreenState extends BaseConsumerState<ChooseAccountScreen> {
  final locator = getIt.get<SharedPreferenceHelper>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(clientAccountsControllerProvider.notifier).getClientAccounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final clientAccountsData = ref.watch(clientAccountsControllerProvider
        .select((value) => value.clientAccounts));
    return Scaffold(
      backgroundColor: Helper.screenBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: false,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            titleSpacing: 12.0.w,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: Transform.rotate(
                angle: 180 * (3.1415926535 / 180),
                child: SvgPicture.asset('assets/images/chevron-right.svg',
                    color: Helper.iconColor, fit: BoxFit.contain),
              ),
            ),
            leadingWidth: 24,
            title: Text(
              "Choose an account",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: clientAccountsData.when(
            data: (data) {
              ;
              return Padding(
                padding: EdgeInsets.all(16.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    mainAxisSpacing: 1.5.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 1 / 1,
                  ),
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Service()
                            .fetchAccountToken(data[index].id!)
                            .then((value) async {
                          dev.log("token" + value['token'].toString());
                          await locator
                              .setUserToken(userToken: value['token'])
                              .then((value) {
                            context.go('/projects');
                          });
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AvatarWidget(
                                dpUrl: data[index].logoUrl != null
                                    ? data[index].logoUrl!
                                    : "",
                                name: data[index].name!,
                                backgroundColor:
                                    data[index].preferences!.primaryColor!,
                                size: 50,
                                fontSize: 24,
                              ),
                              Text(
                                data[index].name!,
                                style: TextStyle(
                                    color: Helper.textColor800,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                    );
                  }),
                ),
              );
            },
            error: (err, _) {
              return const Text("Failed to load Site Gallery",
                  style:
                      TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
            },
            loading: () => LoadingSiteGallery(),
          ),
        ),
      ),
    );
  }
}
