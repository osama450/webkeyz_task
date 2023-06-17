import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/layouts/main/main_screen.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/shared/config/theme.dart';
import 'package:webkeyz_task/shared/cubit/cubit.dart';
import 'package:webkeyz_task/shared/cubit/states.dart';
import 'package:webkeyz_task/shared/di/di.dart';
import 'package:webkeyz_task/shared/network/cubit/cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkCubit>(
          create: (BuildContext context) => di<NetworkCubit>(),
        ),
        BlocProvider<SharedCubit>(
          create: (BuildContext context) => di<SharedCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => di<HomeCubit>()..getProducts(),
        ),
      ],
      child: BlocBuilder<SharedCubit, SharedStates>(
        builder: (BuildContext context, SharedStates state) {
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            builder: (context, child) {
              return MaterialApp(
                theme: AppTheme.main,
                navigatorKey: navigatorKey,
                home: const MainScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
