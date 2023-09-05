import 'package:boat_booking/app_routes.dart';
import 'package:boat_booking/config/router/language_list.dart';
import 'package:boat_booking/data/bindings/initialbindings.dart';
import 'package:boat_booking/utils/bloc/cubit.dart';
import 'package:boat_booking/utils/bloc/states.dart';
import 'package:boat_booking/utils/constants/local_controller.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await SaveMode.init();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return BlocProvider(
        create: (context) => AppCubit()
          ..changeThemeMode(fromShared: controller.isDarkModeEnabled),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return GetMaterialApp(
                      getPages: routs,
                      transitionDuration: const Duration(milliseconds: 500),
                      locale: controller.language,
                      translations: LanguageList(),
                      initialBinding: InitialBindings(),
                      debugShowCheckedModeBanner: false,
                      title: "Boat Booking",
                      theme: controller.appThemeData,
                      themeMode: AppCubit.get(context).isDarkModeEnabled
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    );
                  });
            }));
  }
}
