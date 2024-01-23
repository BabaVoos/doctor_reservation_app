import 'package:doctor_reservation_app/core/helpers/extinsions.dart';
import 'package:doctor_reservation_app/core/routing/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DontHaveAccounText extends StatelessWidget {
  const DontHaveAccounText({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
