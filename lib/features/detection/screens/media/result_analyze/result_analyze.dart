import 'dart:io';

import 'package:agroai/features/detection/models/result_analyze_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constraints/sizes.dart';
import '../../../controllers/model_controller.dart';

class ResultScreen extends StatelessWidget {
  final String resultMessage;
  final ResultAnalyzeModel resultAnalyzeModel;
  final String imagePath;

  const ResultScreen({
    Key? key,
    required this.resultMessage,
    required this.resultAnalyzeModel, required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelController = Get.put(ModelController());

    return Scaffold(
      appBar: TAppBar(
        title: const Text("Hasil Deteksi"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            if (imagePath.isNotEmpty)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(imagePath),
                  ),
                ),
              ),
            Text(resultMessage, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text("Label: ${resultAnalyzeModel.label}"), // Tampilkan label
            Text("Confidence: ${resultAnalyzeModel.probability}"), // Tampilkan confidence
            Text("Pencegahan: ${resultAnalyzeModel.pencegahan}"),
            Text("Pengendalian Hayati: ${resultAnalyzeModel.pengendalianHayati}"),
            Text("Pengendalian Kimiawi: ${resultAnalyzeModel.pengendalianKimiawi}"),
            Text("Penyebab: ${resultAnalyzeModel.penyebab}"),
            Text("Gejala: ${resultAnalyzeModel.gejala}"),
            Text("Kategori: ${resultAnalyzeModel.kategori}"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Panggil fungsi save dari Controller
                  modelController.saveCurrentResult(imagePath);
                },
                child: const Text("Simpan Hasil"),
              ),

            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Panggil fungsi save dari Controller
                  modelController.getDetectionResults();
                },
                child: const Text("Lihat Hasil"),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
