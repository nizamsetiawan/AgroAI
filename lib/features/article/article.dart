import 'package:flutter/material.dart';

import '../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../detection/screens/home/widgets/home_appbar.dart';
class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  THomeAppBar(),
                  ///categories
                  Text('Artikel Screen'),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}