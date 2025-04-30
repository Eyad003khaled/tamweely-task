import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_dimensions.dart';
import 'items/custom_products_list_view_item.dart';

class ProductsCard extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    10,
    (index) => {
      'image': AppImages.imagesAppLogo,
      'title': 'Tamweely Product',
      'description':
          'This is a description of the product. It provides details about the product and its features.',
    },
  );

  ProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: AppDimensions.paddingSizeLarge,
        right: AppDimensions.paddingSizeLarge,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CustomProductsListViewItem(product: product);
      },
    );
  }
}
