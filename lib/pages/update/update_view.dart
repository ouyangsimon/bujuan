import 'package:auto_route/auto_route.dart';
import 'package:bujuan/common/constants/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants/key.dart';
import '../../common/storage.dart';
import '../../routes/router.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if(context.routeData.queryParams.getString('splash').isNotEmpty){
                          bool noFirst = StorageUtil().getBool(noFirstOpen);
                          AutoRouter.of(context).replaceNamed(noFirst ? Routes.home : Routes.guide);
                        }else{
                          AutoRouter.of(context).pop();
                        }
                      },
                      icon: const Icon(TablerIcons.x),
                      iconSize: 52.w,
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                AppIcons.update,
                width: Get.width / 1.5,
                fit: BoxFit.fitWidth,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 30.w)),
              const Text(
                '检测到APP有新版本~',
                style: TextStyle(color: Color(0xFF6C63FF), fontSize: 28),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.w)),
              Text(
                '当前版本: ${context.routeData.queryParams.getString('oldVersion')}  最新版本: ${context.routeData.queryParams.getString('version')}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20.w)),
              Text(
                context.routeData.queryParams.getString('versionInfo').replaceAll(';', '\n'),
                maxLines: 10,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox.shrink()),
              SafeArea(
                child: GestureDetector(
                  child: Container(
                    height: 88.w,
                    alignment: Alignment.center,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: 40.w, horizontal: 15.w),
                    decoration: BoxDecoration(color: const Color(0xFF6C63FF), borderRadius: BorderRadius.circular(20.w)),
                    child: Text(
                      '立即更新',
                      style: TextStyle(fontSize: 32.sp, color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    await launchUrl(Uri.parse(context.routeData.queryParams.getString('downloadUrl')), mode: LaunchMode.externalApplication);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}