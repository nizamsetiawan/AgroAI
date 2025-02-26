import 'package:flutter/material.dart';
import 'package:agroai/utils/constraints/colors.dart';
import 'package:agroai/utils/constraints/sizes.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/option_menu_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';

class PrivacyAndSecurityPage extends StatelessWidget {
  const PrivacyAndSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Privasi dan Keamanan"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section with Text widget
              Text(
                'Keamanan dan Privasi Anda Adalah Prioritas Kami',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: TColors.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TOptionMenuText(
                title:'Kami berkomitmen untuk menjaga privasi dan keamanan data Anda. Di bawah ini, kami menjelaskan bagaimana aplikasi ini mengelola dan melindungi informasi pribadi Anda.',
                maxLines: 10,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Data Collection
              _buildSection(
                title: 'Pengumpulan Data',
                content:
                'Aplikasi ini hanya mengumpulkan data yang diperlukan untuk meningkatkan pengalaman Anda. Kami tidak mengumpulkan data pribadi yang tidak relevan, seperti informasi identitas Anda, tanpa izin Anda.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Data Protection
              _buildSection(
                title: 'Perlindungan Data',
                content:
                'Semua data yang dikumpulkan oleh aplikasi dienkripsi dengan standar keamanan tinggi untuk memastikan data Anda terlindungi dari akses yang tidak sah.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Privacy Policy
              _buildSection(
                title: 'Kebijakan Privasi',
                content:
                'Kami sangat menghargai privasi Anda. Kebijakan privasi kami menjelaskan jenis data yang kami kumpulkan, bagaimana data tersebut digunakan, dan langkah-langkah yang kami ambil untuk melindunginya.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // User Control
              _buildSection(
                title: 'Kontrol Pengguna',
                content:
                'Anda memiliki kontrol penuh atas data Anda. Anda dapat mengakses, mengubah, atau menghapus data pribadi Anda kapan saja melalui pengaturan akun.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Third Party Data Sharing
              _buildSection(
                title: 'Berbagi Data dengan Pihak Ketiga',
                content:
                'Kami tidak akan membagikan data Anda dengan pihak ketiga tanpa izin eksplisit dari Anda, kecuali dalam situasi yang diharuskan oleh hukum.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Security Features
              _buildSection(
                title: 'Fitur Keamanan',
                content:
                'Aplikasi ini dilengkapi dengan fitur keamanan seperti autentikasi dua faktor untuk melindungi akun Anda dari akses yang tidak sah.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Contact Us
              _buildSection(
                title: 'Hubungi Kami',
                content:
                'Jika Anda memiliki pertanyaan atau kekhawatiran tentang privasi atau keamanan data Anda, jangan ragu untuk menghubungi tim dukungan kami di support@agroai.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title widget for each section
        Text(
          title,
          textAlign: TextAlign.center,  // Center align the title
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),
        const SizedBox(height: 8),

        // Content widget with TProductTitleText
        TProductTitleText(
          title: content,
          textAlign: TextAlign.justify,  // Justify text for content
          smallSize: true,  // You can adjust this based on your design preference
          maxLines: 1000,  // Ensures long text doesn't overflow
        ),
      ],
    );
  }
}
