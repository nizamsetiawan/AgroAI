import 'dart:io';

import 'package:agroai/common/widgets/images/t_circular_image.dart';
import 'package:agroai/features/detection/models/result_analyze_model.dart';
import 'package:agroai/utils/constraints/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constraints/colors.dart';
import '../../../../../utils/constraints/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/model_controller.dart';

class ResultScreen extends StatelessWidget {
  final String label;
  final String confidence;
  final ResultAnalyzeModel resultAnalyzeModel;
  final String imagePath;
  final bool? isFromHistory;

  const ResultScreen({
    Key? key,
    required this.label,
    required this.confidence,
    required this.resultAnalyzeModel,
    required this.imagePath,
    this.isFromHistory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelController = Get.put(ModelController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: const Text("Hasil Analisis"),
          showBackArrow: isFromHistory!,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imagePath.isNotEmpty)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary, width: 2),
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        child: TRoundedContainer(
                          radius: TSizes.sm,
                          backgroundColor: TColors.primary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            'Kategori - ${resultAnalyzeModel.kategori}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Text(
                  "Akurasi : ${confidence}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              Text(
                "Gejala",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                height: TSizes.borderRadiusMd,
              ),
              TProductTitleText(
                title: resultAnalyzeModel.gejala,
                textAlign: TextAlign.justify,
                smallSize: true,
                maxLines: 1000,
              ),
              Text(
                "Rekomendasi",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                height: TSizes.borderRadiusMd,
              ),
              TRoundedContainer(
                padding: const EdgeInsets.only(
                    top: TSizes.spaceBtwItems / 2,
                    right: TSizes.spaceBtwItems / 2,
                    left: TSizes.borderRadiusSm),
                showBorder: true,
                borderColor: isDark ? TColors.secondary : TColors.primary,
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TCircularImage(
                          padding: 0,
                          image:
                              "https://img.icons8.com/?size=100&id=117418&format=png&color=000000",
                          isNetworkImage: true,
                          width: 25,
                          height: 25,
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengendalian Hayati",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? TColors.primary
                                      : TColors.secondary,
                                ),
                              ),
                              const SizedBox(
                                height: TSizes.borderRadiusMd,
                              ),
                              TProductTitleText(
                                title: resultAnalyzeModel.pengendalianHayati,
                                textAlign: TextAlign.justify,
                                smallSize: true,
                                maxLines: 1000,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TCircularImage(
                          padding: 0,
                          image:
                              "https://img.icons8.com/?size=100&id=W5RvDYCw70Wr&format=png&color=000000",
                          isNetworkImage: true,
                          width: 25,
                          height: 25,
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengendalian Kimiawi",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? TColors.primary
                                      : TColors.secondary,
                                ),
                              ),
                              const SizedBox(
                                height: TSizes.borderRadiusMd,
                              ),
                              TProductTitleText(
                                title: resultAnalyzeModel.pengendalianHayati,
                                textAlign: TextAlign.justify,
                                smallSize: true,
                                maxLines: 1000,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              Text(
                "Apa Penyebabnya ?",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                height: TSizes.borderRadiusMd,
              ),
              TProductTitleText(
                title: resultAnalyzeModel.penyebab,
                textAlign: TextAlign.justify,
                smallSize: true,
                maxLines: 1000,
              ),
              Text(
                "Pencegahan",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(
                height: TSizes.borderRadiusMd,
              ),
              TProductTitleText(
                title: resultAnalyzeModel.pencegahan,
                textAlign: TextAlign.justify,
                smallSize: true,
                maxLines: 1000,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              if ((!isFromHistory!))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                        Expanded(
                          child: SizedBox(
                            child: OutlinedButton(
                              onPressed: () {
                                modelController.saveCurrentResult(imagePath);
                              },
                              child: const Text(TTexts.btnSaveToHistory),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.defaultSpace,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.offAll(NavigationMenu());
                              },
                              child: const Text(TTexts.btnBackAll),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],

          ),
        ),
      ),
    );
  }
}
