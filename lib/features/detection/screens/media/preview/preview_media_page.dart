import 'dart:io';
import 'package:agroai/common/widgets/images/t_rounded_image.dart';
import 'package:agroai/utils/constraints/colors.dart';
import 'package:agroai/utils/constraints/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../utils/constraints/sizes.dart';
import '../../../../../utils/constraints/text_strings.dart';
import '../result_analyze/result_analyze.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pratinjau Gambar")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TTexts.alertPreviewImage,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              if (imageFile != null)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary, width: 2),
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(imageFile!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                TRoundedImage(
                  imageUrl: TImages.imagePlaceholder,
                  width: double.infinity,
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String detectionResult =
                        await _detectDisease(imageFile!.path);
                    Get.to(() => ResultScreen(resultMessage: detectionResult));
                  },
                  child: const Text("Scan Disease"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A placeholder function simulating disease detection.
  // Replace this with the actual logic.
  Future<String> _detectDisease(String imagePath) async {
    await Future.delayed(const Duration(seconds: 2));
    return "Detection Complete: Disease X identified.";
  }
}
