
import 'package:chain_verify_tm/view/widget/custom_bottom_nav_Bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class ChainVerityTm extends StatelessWidget {
  const ChainVerityTm({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: Size(375, 812),
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: CustomBottomNavBar(),
          theme: ThemeData(),
        );
      },
    );
  }
}
