import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agroai/common/widgets/login_signup/form_divider.dart';
import 'package:agroai/common/widgets/login_signup/social_buttons.dart';
import 'package:agroai/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:agroai/utils/constraints/sizes.dart';
import 'package:agroai/utils/constraints/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///form
              const TSignupForm(),
              const SizedBox(height: TSizes.defaultSpace),

              ///divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.defaultSpace),

              ///social buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
