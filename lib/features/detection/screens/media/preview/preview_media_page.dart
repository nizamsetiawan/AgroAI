import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constraints/colors.dart';
import '../../../../../utils/constraints/image_strings.dart';
import '../../../../../utils/constraints/sizes.dart';
import '../../../../../utils/constraints/text_strings.dart';
import '../../../controllers/model_controller.dart';
import '../result_analyze/result_analyze.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    final modelController = Get.put(ModelController());

    return Scaffold(
      appBar: TAppBar(title: const Text("Pratinjau Gambar"), showBackArrow: true,),
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
                    if (imageFile != null) {
                      await modelController.loadModel();
                      await modelController.runInference(imageFile!.path);
                    }
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
}
