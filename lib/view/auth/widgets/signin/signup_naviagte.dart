import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/shared/styles.dart';

class SignupNavigate extends StatelessWidget {
  const SignupNavigate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Opacity(
          opacity: 1,
          child: Text(
            "Don't have an account ",
            style: Styles.textStyle16,
          ),
        ),
        GestureDetector(
          onTap: () {
         
          },
          child: Text("SignUp",
              style:
                  Styles.textStyle18.copyWith(color: ColorsApp.kprimaryColor1)),
        ),
      ],
    );
  }
}
