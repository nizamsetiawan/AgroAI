import 'dart:io';

import 'package:agroai/features/detection/models/result_analyze_model.dart';
import 'package:agroai/utils/logging/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ModelRepository {
  static ModelRepository get instance => Get.find();
  final localStorage = GetStorage();
  var isModelLoaded = false;

  final _db = FirebaseFirestore.instance;


  Future<String?> loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        // model: "assets/model/modelSkripsiNizaTomat.tflite",
        // labels: "assets/model/tomato.txt",
        model: "assets/model/DeteksiPenyakitTanamanMoNet.tflite",
        labels: "assets/model/label.txt",
      );
      isModelLoaded = true;
      return res;
    } catch (e) {
      TLoggerHelper.error("Failed to load the model: $e");
      return null;
    }
  }

  Future<List<ResultAnalyzeModel>> getResultAnalyzeDisease(String label) async {
    try {
      final snapshot = await _db
          .collection('Analyze')
          .where('label', isEqualTo: label)
          .get();
      return snapshot.docs.map((e) {
        final data = e.data();
        final pencegahan = data['pencegahan'] as String;
        final pencegahanList = pencegahan.split('.').where((point) => point.trim().isNotEmpty).toList();
        final formattedPencegahan = pencegahanList.asMap().entries.map((entry) {
          return '${entry.key + 1}. ${entry.value.trim()}';
        }).join('\n');

        return ResultAnalyzeModel.fromSnapshot(e)..pencegahan = formattedPencegahan;
      }).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again';
    }
  }


  Future<List<dynamic>?> runModelOnImage(String filepath) async {
    if (!isModelLoaded) {
      print("Model not loaded yet");
      return null;
    }
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: filepath,
          imageMean: 0.0,
          imageStd: 255.0,
        numResults: 1,
        threshold: 0.4,
        asynch: true,
      );
      return recognitions;
    } catch (e) {
      print("Error running inference: $e");
      return null;
    }
  }

  Future<void> closeModel() async {
    await Tflite.close();
    isModelLoaded = false;
  }

  Future<String> saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final String imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await imageFile.copy(imagePath);
    return imagePath;
  }

  void saveDetectionResult(ResultAnalyzeModel result) {
    List<dynamic> savedResults = localStorage.read('detectionResults') ?? [];
    savedResults.add(result.toJson());
    localStorage.write('detectionResults', savedResults);
    TLoggerHelper.info("Data yang disimpan: ${result.toJson()}");
  }

  List<ResultAnalyzeModel> getDetectionResults() {
    List<dynamic> savedResults = localStorage.read('detectionResults') ?? [];
    TLoggerHelper.info("Data yang disimpan: $savedResults");
    return savedResults.map((json) => ResultAnalyzeModel.fromJson(json)).toList();
  }

  void deleteDetectionResultByIndex(int index) {
    List<dynamic> savedResults = localStorage.read('detectionResults') ?? [];

    if (index >= 0 && index < savedResults.length) {
      savedResults.removeAt(index); // Hapus item berdasarkan indeks
      localStorage.write('detectionResults', savedResults); // Simpan kembali ke local storage
      TLoggerHelper.info("Item dengan indeks $index berhasil dihapus.");
    } else {
      TLoggerHelper.error("Indeks tidak valid: $index");
    }
  }

  void deleteAllDetectionResults() {
    localStorage.remove('detectionResults'); // Hapus semua data
    TLoggerHelper.info("Semua hasil deteksi berhasil dihapus.");
  }

}
