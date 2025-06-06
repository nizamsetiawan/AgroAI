import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agroai/data/repositories/user/user_repository.dart';
import 'package:agroai/features/personalization/controllers/user_controller.dart';
import 'package:agroai/features/personalization/screens/profile/profile.dart';
import 'package:agroai/utils/constraints/image_strings.dart';
import 'package:agroai/utils/helpers/loaders.dart';
import 'package:agroai/utils/helpers/network_manager.dart';
import 'package:agroai/utils/popups/full_screen_loader.dart';

import '../../../utils/logging/logger.dart';

///controller to manage user related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>(); //form key for form validation


  ///init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      //start loading
      TFullScreenLoader.openLoadingDialog('Kami sedang memperbarui informasi Anda...', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //update user's first & last name in firebase firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      //Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      TFullScreenLoader.stopLoading();

      TLoggerHelper.debug('Updated name: ${userController.user.value.firstName} ${userController.user.value.lastName}');

      // show success snack bar
      TLoaders.successSnackBar(title: 'Selamat', message: 'Nama anda berhasil diubah');

      //move to previous screen
      Get.off(() => const ProfileScreen());

    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();

      //show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh tidak...!', message: e.toString());
    }
  }

}