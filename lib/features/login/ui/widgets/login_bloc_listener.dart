import 'package:doctor_reservation_app/core/helpers/extinsions.dart';
import 'package:doctor_reservation_app/core/routing/router.dart';
import 'package:doctor_reservation_app/core/theming/colors.dart';
import 'package:doctor_reservation_app/core/theming/styles.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        // either loading state or success state or error state will be handled or null 
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
          },
          error: (error) {
            setupErroState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErroState(BuildContext context, String error) {
      context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon:  const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [  
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          )
        ],
      ),
    );
  }
}
