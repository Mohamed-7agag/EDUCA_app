import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            theme: ThemeData.light().copyWith(
                textTheme: GoogleFonts.interTextTheme(
                  ThemeData.light().textTheme,
                )),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRouter.splashViewRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}