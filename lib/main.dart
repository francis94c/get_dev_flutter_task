import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_dev_flutter_task/blocs/auth/auth_bloc.dart';
import 'package:get_dev_flutter_task/blocs/crypto/crypto_bloc.dart';
import 'package:get_dev_flutter_task/config/app_colors.dart';
import 'package:get_dev_flutter_task/presentation/screens/dashboard.dart';
import 'package:get_dev_flutter_task/presentation/screens/login.dart';
import 'package:get_dev_flutter_task/presentation/screens/transactions.dart';
import 'package:get_dev_flutter_task/service_locator.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(),
          ),
          BlocProvider<CryptoBloc>(
            create: (context) => CryptoBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Senior Flutter Developer Assessment',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: AppColors.primaryColor,
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          initialRoute: LogInScreen.routeName,
          routes: {
            LogInScreen.routeName: (context) => const LogInScreen(),
            DashboardScreen.routeName: (context) => const DashboardScreen(),
            TransactionsScreen.routeName: (context) =>
                const TransactionsScreen(),
          },
        ),
      ),
    );
  }
}
