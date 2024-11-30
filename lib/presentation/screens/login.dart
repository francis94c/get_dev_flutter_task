import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_dev_flutter_task/blocs/auth/auth_bloc.dart';
import 'package:get_dev_flutter_task/config/app_spacing.dart';
import 'package:get_dev_flutter_task/extensions/build_context.dart';
import 'package:get_dev_flutter_task/presentation/screens/dashboard.dart';
import 'package:get_dev_flutter_task/presentation/widgets/app_text_field.dart';
import 'package:get_dev_flutter_task/presentation/widgets/button.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left_rounded),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontalSpacing,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Log in to your account",
                style: context.textTheme.bodyLarge,
              ),
              AppSpacing.verticalSpaceSmall,
              const Text(
                  'Welcome back! Please enter your registered email address to continue'),
              AppSpacing.verticalSpaceMedium,
              AppTextField(
                labelText: 'Email address',
                onChanged: (value) => context.read<AuthBloc>().add(
                      AuthEvent.emailChanged(value),
                    ),
              ),
              AppSpacing.verticalSpaceSmall,
              AppTextField(
                labelText: 'Password',
                onChanged: (value) => context.read<AuthBloc>().add(
                      AuthEvent.passwordChanged(value),
                    ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(.05.sw),
        child: Button('Continue',
            onPressed: () =>
                context.navigator.popAndPushNamed(DashboardScreen.routeName)),
      ),
    );
  }
}
