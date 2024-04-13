import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/utils/routes.dart';

void main() {
  appServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: MaterialApp(
              theme: ThemeData.light().copyWith(
                  textTheme: GoogleFonts.tajawalTextTheme(
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
              initialRoute: Routes.splashViewRoute,
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
