import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agroai/features/authentication/controllers/signup/signup_controller.dart';
import 'package:agroai/utils/constraints/colors.dart';
import 'package:agroai/utils/constraints/sizes.dart';
import 'package:agroai/utils/constraints/text_strings.dart';
import 'package:agroai/utils/helpers/helper_functions.dart';

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(
              () => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value =
                      !controller.privacyPolicy.value),
            )),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.labelSmall),
            TextSpan(
                text: '${TTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    )),
            TextSpan(
                text: '${TTexts.and} ',
                style: Theme.of(context).textTheme.labelSmall),
            TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    )),
          ]),
        ),
      ],
    );
  }
}
