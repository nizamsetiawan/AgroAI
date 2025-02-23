import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:agroai/common/widgets/appbar/appbar.dart';
import 'package:agroai/features/personalization/controllers/update_name_controller.dart';
import 'package:agroai/utils/constraints/sizes.dart';
import 'package:agroai/utils/constraints/text_strings.dart';
import 'package:agroai/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      ///custom appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Ganti Nama'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///headings
            Text('Use real name for verification', style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///text field and button
            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
