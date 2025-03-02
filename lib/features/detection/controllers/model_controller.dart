import 'dart:io';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agroai/features/detection/models/result_analyze_model.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/repositories/disease/model_repository.dart';
import '../../../utils/constraints/image_strings.dart';
import '../../../utils/helpers/loaders.dart';
import '../../../utils/logging/logger.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../screens/media/result_analyze/result_analyze.dart';

class ModelController extends GetxController {
  final localStorage = GetStorage();
  final ModelRepository modelRepository = Get.put(ModelRepository());
  final RxList<ResultAnalyzeModel> resultAnalyzeModel = <ResultAnalyzeModel>[].obs;
  final RxBool isModelLoaded = false.obs;
  final RxString selectedLabel = ''.obs;
  final RxMap<String, Map<String, String>> handlingInstructions = <String, Map<String, String>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      TLoggerHelper.info("Attempting to load model...");
      String? res = await modelRepository.loadModel();
      if (res != null) {
        TLoggerHelper.info("Model loaded successfully: $res");
        isModelLoaded.value = true;
      } else {
        TLoggerHelper.error("Failed to load model");
        Get.snackbar("Error", "Could not load model.");
      }
    } catch (e) {
      TLoggerHelper.error("Error loading model", e);
      Get.snackbar("Error", "Could not load model: ${e.toString()}");
    }
  }

  Future<void> fetchResultAnalyzeDisease(String label, double confidence) async {
    try {
      TFullScreenLoader.openLoadingDialog('Sedang Analisis...', TImages.docerAnimation);

      isModelLoaded.value = true;
      selectedLabel.value = label;

      final resultAnalyze = await modelRepository.getResultAnalyzeDisease(label);
      resultAnalyzeModel.assignAll(resultAnalyze);

      if (resultAnalyze.isNotEmpty) {
        final result = resultAnalyze.first;
        handlingInstructions[label] = {
          'pencegahan': result.pencegahan,
          'pengendalian_hayati': result.pengendalianHayati,
          'pengendalian_kimiawi': result.pengendalianKimiawi,
          'penyebab': result.penyebab,
          'gejala': result.gejala,
          'kategori': result.kategori,
          'label': result.label,
          'probability': result.probability,
        };
        resultAnalyzeModel.first.probability = (confidence * 100).toStringAsFixed(1) + '%';

      }
      await Future.delayed(Duration(seconds: 5));

    } catch (e) {
      TLoggerHelper.error('Error while fetching result analyze', e);
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isModelLoaded.value = false;
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> runInference(String imagePath) async {
    try {
      var recognitionsResult = await modelRepository.runModelOnImage(imagePath);
      if (recognitionsResult != null) {
        String label = recognitionsResult.first['label'];
        double confidence = recognitionsResult.first['confidence'];
        String confidencePercentage = (confidence * 100).toStringAsFixed(1) + '%';

        await fetchResultAnalyzeDisease(label, confidence);

        Get.to(() => ResultScreen(
          resultMessage: "Hasil Deteksi: $label, Confidence: $confidencePercentage",
          resultAnalyzeModel: resultAnalyzeModel.first,
          imagePath: imagePath,
        ));
      } else {
        Get.snackbar("Error", "No recognitions found.");
      }
    } catch (e) {
      TLoggerHelper.error("Error running inference", e);
      Get.snackbar("Error", "Could not run inference: ${e.toString()}");
    }
  }

  Future<void> releaseModel() async {
    try {
      await modelRepository.closeModel();
      isModelLoaded.value = false;
    } catch (e) {
      TLoggerHelper.error("Error releasing model", e);
    }
  }

  List<ResultAnalyzeModel> getDetectionResults() {
    return modelRepository.getDetectionResults();
  }

  Future<void> saveCurrentResult(String imagePath) async {
    try {
      final resultAnalyze = resultAnalyzeModel.first;

      final String savedImagePath = await modelRepository.saveImageLocally(File(imagePath));

      final result = ResultAnalyzeModel(
        label: resultAnalyze.label,
        pencegahan: resultAnalyze.pencegahan,
        pengendalianHayati: resultAnalyze.pengendalianHayati,
        pengendalianKimiawi: resultAnalyze.pengendalianKimiawi,
        penyebab: resultAnalyze.penyebab,
        gejala: resultAnalyze.gejala,
        kategori: resultAnalyze.kategori,
        imagePath: savedImagePath,
        probability: resultAnalyze.probability,
      );
      modelRepository.saveDetectionResult(result);
    } catch (e) {
      TLoggerHelper.error("Error saving result", e);
    }
  }

  void deleteResultByIndex(int index) {
    try {
      modelRepository.deleteDetectionResultByIndex(index);
      Get.snackbar("Berhasil", "Hasil deteksi berhasil dihapus!");
    } catch (e) {
      TLoggerHelper.error("Error deleting result", e);
      Get.snackbar("Error", "Gagal menghapus hasil deteksi: ${e.toString()}");
    }
  }

  void deleteAllResults() {
    try {
      modelRepository.deleteAllDetectionResults();
      Get.snackbar("Berhasil", "Semua hasil deteksi berhasil dihapus!");
    } catch (e) {
      TLoggerHelper.error("Error deleting all results", e);
      Get.snackbar("Error", "Gagal menghapus semua hasil deteksi: ${e.toString()}");
    }
  }

}