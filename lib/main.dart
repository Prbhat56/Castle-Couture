import 'package:castle_couture/presentation/b_home_page/home_page.dart';
import 'package:castle_couture/routes/route_generator.dart';
import 'package:castle_couture/widgets/custom_multi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return CustomBlocProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: const HomePage(),
            onGenerateRoute: RoutesGenerator.generateRoutes,
          ),
        );
      },
    );
  }
}
