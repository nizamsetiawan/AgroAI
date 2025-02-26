import 'package:agroai/data/repositories/user/user_repository.dart';
import 'package:agroai/features/personalization/controllers/user_controller.dart';
import 'package:agroai/features/personalization/models/feedback_model.dart';
import 'package:agroai/features/personalization/screens/settings/settings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utils/constraints/image_strings.dart';
import '../../../utils/helpers/loaders.dart';
import '../../../utils/popups/full_screen_loader.dart';

class FeedbackController extends GetxController {
  static FeedbackController get instance => Get.find();
  final feedbackLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;
  GlobalKey<FormState> feedbackFormKey = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initializeFeedbackData();
  }

  Future<void> _initializeFeedbackData() async {
   usernameController.text = userController.user.value.username;
   emailController.text = userController.user.value.email;
  }

  Future<void> submitFeedback() async {
    try {
      TFullScreenLoader.openLoadingDialog('Mengirim umpan balik Anda...', TImages.docerAnimation);

      if (!feedbackFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      FeedbackModel feedback = FeedbackModel(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        subject: subjectController.text.trim(),
        message: messageController.text.trim(),
      );

      await userRepository.saveFeedbackRecord(feedback);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Berhasil', message: 'Umpan balik berhasil dikirim');

      Get.off(() => const SettingsScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh tidak...', message: e.toString());
    }
  }
}
