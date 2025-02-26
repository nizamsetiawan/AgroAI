import 'package:flutter/material.dart';
import 'package:agroai/common/widgets/appbar/appbar.dart';
import 'package:agroai/common/widgets/texts/product_title_text.dart';
import 'package:agroai/utils/constraints/colors.dart';
import 'package:agroai/utils/constraints/sizes.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Panduan Penggunaan"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title section
              Text(
                'Cara Menggunakan AgroAI',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Step 1
              _buildStepSection(
                context,
                'Langkah 1: Ambil Gambar Daun',
                'Ambil gambar daun tanaman yang ingin Anda deteksi menggunakan kamera ponsel pintar. Pastikan gambar yang diambil jelas dan fokus pada daun yang ingin diperiksa.',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Step 2
              _buildStepSection(
                context,
                'Langkah 2: Deteksi Penyakit Tanaman',
                'Aplikasi ini mendeteksi penyakit pada daun tanaman dengan menggunakan algoritma kecerdasan buatan. Namun, perlu diketahui bahwa aplikasi ini hanya mendukung deteksi penyakit pada tiga jenis tanaman: Tomat, Singkong, dan Jagung.',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Step 3
              _buildStepSection(
                context,
                'Langkah 3: Analisis Penyakit',
                'Aplikasi akan menganalisis gambar dan memberikan informasi tentang kemungkinan penyakit pada daun tanaman. Anda akan menerima rekomendasi pengobatan untuk penyakit tersebut.',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Step 4
              _buildStepSection(
                context,
                'Langkah 4: Lakukan Tindakan Pencegahan',
                'Ikuti rekomendasi untuk menangani penyakit tersebut. Anda dapat menggunakan pestisida yang sesuai atau metode perawatan lainnya untuk mencegah penyebaran penyakit.',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Step 5
              _buildStepSection(
                context,
                'Langkah 5: Pantau Kesehatan Tanaman',
                'Setelah perawatan dilakukan, terus pantau kondisi tanaman Anda menggunakan aplikasi untuk memastikan tanaman tetap sehat dan bebas dari penyakit.',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Additional Features section
              _buildStepSection(
                context,
                'Fitur Tambahan: Riwayat Analisis',
                'AgroAI menyediakan fitur riwayat analisis yang memungkinkan Anda untuk melacak hasil deteksi penyakit tanaman sebelumnya. Fitur ini membantu Anda untuk mengawasi perkembangan tanaman Anda dari waktu ke waktu dan memastikan tanaman Anda selalu terjaga dari penyakit.',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Additional Features section (Articles)
              _buildStepSection(
                context,
                'Fitur Tambahan: Artikel Pertanian',
                'Aplikasi ini juga menyediakan berbagai artikel yang berhubungan dengan pertanian, khususnya yang berkaitan dengan tiga jenis tanaman utama kami, yaitu Tomat, Singkong, dan Jagung. Artikel-artikel ini memberikan informasi yang berguna mengenai perawatan tanaman, cara mengatasi penyakit, dan tips bertani yang lebih efektif.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepSection(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step title
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),
        const SizedBox(height: 8),

        // Step description
        TProductTitleText(
          title: description,
          textAlign: TextAlign.justify,
          smallSize: true,
          maxLines: 1000,
        ),
      ],
    );
  }
}
