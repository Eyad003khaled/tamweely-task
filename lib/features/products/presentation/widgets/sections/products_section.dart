import 'package:flutter/material.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_app_bar.dart';

import '../products_card.dart';



class ProductsSection extends StatelessWidget {


  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.products),
      body:ProductsCard()
    );
  }
}

