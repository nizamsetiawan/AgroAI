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
                      title: 'Pengaturan Akun', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Akun Terhubung',
                    subTitle: 'Kelola akun media sosial dan akun pihak ketiga yang terhubung',
                    onTap: () => showFeatureUnderDevelopmentDialog(context),
                  ),
                  TSettingsMenuTile(
                      icon: Iconsax.language_square,
                      title: 'Ganti Bahasa',
                      onTap: () => showFeatureUnderDevelopmentDialog(context),
                      subTitle:
                          'Pilih bahasa yang Anda inginkan untuk aplikasi'),
                  TSettingsMenuTile(
                    icon: Iconsax.data,
                    title: 'Unduhan',
                    subTitle: 'Lihat dan kelola file yang telah diunduh',
                    onTap: () => showFeatureUnderDevelopmentDialog(context),
                  ),
                  TSettingsMenuTile(
                      icon: Iconsax.support,
                      title: 'Bantuan & Dukungan',
                      onTap: () => showFeatureUnderDevelopmentDialog(context),
                      subTitle:
                          'Temukan jawaban atas pertanyaan Anda atau hubungi dukungan kami'),
                  TSettingsMenuTile(
                      icon: Iconsax.money,
                      onTap: () => showFeatureUnderDevelopmentDialog(context),
                      title: 'Langganan Premium',
                      subTitle:
                          'Nikmati fitur eksklusif dan lebih banyak manfaat'),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'Kualitas Gambar',
                    subTitle: 'Gunakan kualitas gambar tinggi',
                    trailing: Switch(
                        value: false,
                        onChanged: (value) {
                          showFeatureUnderDevelopmentDialog(context);
                        }),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.sun,
                    title: 'Mode',
                    subTitle: 'Gunakan mode gelap',
                    trailing: Switch(
                        value: true,
                        onChanged: (value) {
                          showFeatureUnderDevelopmentDialog(context);
                        }),
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
                      onTap: () => showFeatureUnderDevelopmentDialog(context),
                      subTitle: 'Kelola privasi dan keamanan akun Anda'),

                  ///--logout button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          PanaraConfirmDialog.show(
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
                            panaraDialogType: PanaraDialogType.normal,
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
