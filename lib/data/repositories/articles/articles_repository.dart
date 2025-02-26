import 'package:agroai/features/article/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ArticlesRepository extends GetxController {
  static ArticlesRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ArticleModel>> getAllArticles() async {
    try {
      final snapshot = await _db.collection('Articles').get();
      final result =
          snapshot.docs.map((e) => ArticleModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching articles';
    }
  }

  Future<List<ArticleModel>> getArticlesByCategory(String category) async {
    try {
      final snapshot = await _db
          .collection('Articles')
          .where('category', isEqualTo: category)
          .get();
      return snapshot.docs.map((e) => ArticleModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again';
    }
  }

  // Future<List<ArticleModel>> fetchArticlesByQuery(Query query) async {
  //   try {
  //     final querySnapshot = await query.get();
  //     final List<ArticleModel> productList = querySnapshot.docs
  //         .map((documentSnapshot) =>
  //         ArticleModel.fromQuerySnapshot(documentSnapshot))
  //         .toList();
  //     return productList;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong! Please try again';
  //   }
  // }
}
