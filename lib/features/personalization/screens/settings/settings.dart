import 'package:agroai/features/personalization/screens/settings/widgets/privacy_securty_page.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:agroai/common/widgets/appbar/appbar.dart';
import 'package:agroai/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:agroai/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:agroai/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:agroai/common/widgets/texts/section_heading.dart';
import 'package:agroai/data/repositories/authentication/authentication_repository.dart';
import 'package:agroai/features/personalization/screens/profile/profile.dart';
import 'package:agroai/utils/constraints/colors.dart';
import 'package:agroai/utils/constraints/sizes.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  TAppBar(
                      title: Text('Akun Saya',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),

                  ///user profile card
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///-- Account settings
                  const TSectionHeading(
                      title: 'Preferensi & Pengaturan', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                      icon: Iconsax.sun,
                      title: 'Ganti Tema',
                      onTap: () => AppSettings.openAppSettings(
                          type: AppSettingsType.display),
                      subTitle:
                          'Pilih antara tema gelap dan terang untuk aplikasi Anda'),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Lokasi',
                    subTitle: 'Kelola pengaturan lokasi perangkat',
                    onTap: () => AppSettings.openAppSettings(
                        type: AppSettingsType.location),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.setting,
                    title: 'Opsi Lainnya',
                    subTitle: 'Temukan pengaturan lainnya yang dapat disesuaikan.',
                    onTap: () => AppSettings.openAppSettings(
                        type: AppSettingsType.generalSettings),
                  ),
                  ///-- App settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'Tentang Aplikasi', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.information,
                      title: 'Tentang',
                      onTap: () => showFeatureUnderDevelopmentDialog(context),
                      subTitle:
                          'Informasi tentang aplikasi dan tim pengembang'),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Berikan Penilaian',
                    onTap: () {
                      showFeatureUnderDevelopmentDialog(context);
                    },
                    subTitle:
                        'Bantu kami dengan memberikan ulasan di Play Store',
                  ),
                  TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Privasi dan Keamanan',
                      onTap: ()=> Get.to(() => PrivacyAndSecurityPage()),
                      subTitle: 'Kelola privasi dan keamanan akun Anda'),

                  ///--logout button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          PanaraConfirmDialog.show(
                            color: TColors.primary,
                            context,
                            title: "Konfirmasi Logout",
                            message: "Apakah Anda yakin ingin logout?",
                            confirmButtonText: "Keluar",
                            cancelButtonText: "Batal",
                            onTapCancel: () {
                              Navigator.pop(context);
                            },
                            onTapConfirm: () {
                              AuthenticationRepository.instance.logout();
                            },
                            panaraDialogType: PanaraDialogType.custom,
                            barrierDismissible:
                                false, // optional parameter (default is true)
                          );
                        },
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showFeatureUnderDevelopmentDialog(BuildContext context) {
  PanaraInfoDialog.show(
    context,
    title: "Maaf",
    message: "Fitur ini masih dalam tahap pengembangan",
    buttonText: "Okay",
    onTapDismiss: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.normal,
    barrierDismissible: false, // Tidak bisa dismiss dengan mengetuk luar
  );
}
