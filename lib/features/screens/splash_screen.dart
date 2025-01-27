import 'package:flutter/material.dart';
import 'package:url_app/features/screens/url_host_screen.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../core/database/api/end_points.dart';
import '../../core/database/cache_helper/cache_helper.dart';
import '../../core/routes/app_routes.dart';
import '../../core/services/service_locator.dart';
import '../../core/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override



  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async{
    bool isVisted = await sl<CacheHelper>().getData(
      key: AppStrings.urlHostKey,
    ) ??
        false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => isVisted ? const SplashScreen() : UrlHostScreen(),
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        CustomImage(
          imagePath: AppAssets.splash,
          fit: BoxFit.fill,
        ),
      ]),
      // backgroundColor: AppColors.primary,
    );
  }
}
