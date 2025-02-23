import 'package:agroai/features/detection/screens/home/widgets/home_appbar.dart';
import 'package:agroai/features/detection/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:agroai/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:agroai/utils/constraints/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  THomeAppBar(),
                  ///categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///heading of categories
                        // TSectionHeading(
                        //     title: 'Kategori Mindfulness',
                        //     showActionButton: false,
                        //     textColor: Colors.white),
                        // SizedBox(height: TSizes.spaceBtwItems),

                        ///categories
                        // THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
