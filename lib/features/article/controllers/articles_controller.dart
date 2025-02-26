import 'package:agroai/data/repositories/articles/articles_repository.dart';
import 'package:agroai/features/article/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/helpers/loaders.dart';
import '../../../utils/logging/logger.dart';

class ArticleController extends GetxController {
  static ArticleController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<ArticleModel> allArticles = <ArticleModel>[].obs;
  final RxList<ArticleModel> categoryArticles = <ArticleModel>[].obs;

  final articlesRepository = Get.put(ArticlesRepository());
  final RxString selectedOptions = 'Nama A-Z'.obs;
  final RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    fetchAllArticles();
    super.onInit();
  }
  void fetchAllArticles() async {
    try {
      TLoggerHelper.info('Fetching featured articles...');

      isLoading.value = true;

      final articles = await articlesRepository.getAllArticles();

      TLoggerHelper.info(
          'Fetched featured articles: ${articles.length} articles');

      allArticles.assignAll(articles);
    } catch (e) {
      TLoggerHelper.error('Error while fetching featured articles', e);
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchArticlesByCategory(String category) async {
    try {
      isLoading.value = true;
      selectedCategory.value = category;

      final articles = await articlesRepository.getArticlesByCategory(category);
      categoryArticles.assignAll(articles);

      TLoggerHelper.info('Fetched ${articles.length} articles for category: $category');
    } catch (e) {
      TLoggerHelper.error('Error while fetching articles by category', e);
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Future<List<ArticleModel>> fetchAllFeaturedArticle() async {
  //   try {
  //     //fetch products
  //     final products = await articlesRepository.getAllArticles();
  //     return products;
  //   } catch (e) {
  //     TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
  //     return [];
  //   }
  // }



//   Future<List<ArticleModel>> fetchArticlesByQuery(Query? query) async {
//     try {
//       if (query == null) return [];
//       final products = await articlesRepository.fetchArticlesByQuery(query);
//       return products;
//     } catch (e) {
//       TLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
//       return [];
//     }
//   }
//
//   void setSelectedOptions(String value) {
//     selectedOptions.value = value;
//
//     switch (value) {
//       case 'Nama A-Z':
//         allArticles.sort((a, b) => a.title.compareTo(b.title));
//         break;
//       case 'Tanggal Terakhir':
//         allArticles.sort((a, b) {
//           DateTime dateA = _parseDate(a.createdAt);
//           DateTime dateB = _parseDate(b.createdAt);
//           return dateB.compareTo(dateA);
//         });
//         break;
//       case 'Tanggal Terawal':
//         allArticles.sort((a, b) {
//           DateTime dateA = _parseDate(a.createdAt);
//           DateTime dateB = _parseDate(b.createdAt);
//           return dateA.compareTo(dateB);
//         });
//         break;
//       default:
//         allArticles.sort((a, b) => a.title.compareTo(b.title));
//     }
//   }
//
//   void assignProducts(List<ArticleModel> products) {
//     this.allArticles.assignAll(products);
//     setSelectedOptions('Nama A-Z');
//   }
// }
//
// DateTime _parseDate(String dateStr) {
//   try {
//     final DateFormat format = DateFormat('d MMMM yyyy');
//     return format.parse(dateStr);
//   } catch (e) {
//     throw Exception('Error parsing date: $e');
//   }
}
