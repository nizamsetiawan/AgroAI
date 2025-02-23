import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agroai/common/styles/spacing_styles.dart';
import 'package:agroai/common/widgets/login_signup/form_divider.dart';
import 'package:agroai/common/widgets/login_signup/social_buttons.dart';
import 'package:agroai/features/authentication/screens/login/widgets/login_form.dart';
import 'package:agroai/features/authentication/screens/login/widgets/login_header.dart';
import 'package:agroai/utils/constraints/sizes.dart';
import 'package:agroai/utils/constraints/text_strings.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo,title,subtitle
              const TLoginHeader(),

              ///form
              const TLoginForm(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.defaultSpace),


              ///footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}








