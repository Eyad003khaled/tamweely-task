import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/no_internet_connection.dart';
import '../../../../core/functions/toast/custom_toast.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/widgets/redacted/custom_redacted_product_item.dart';
import '../cubit/products_cubit.dart';
import 'items/custom_products_list_view_item.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoadingState) {
          // Return redacted version while loading
          return ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return const CustomRedactedProductItem();
            },
          );
        } else if (state is GetProductsFailureState) {
          // Handle failure state
          return NoInternetConnection(
            fetchDataCallback: () =>
                BlocProvider.of<ProductsCubit>(context).fetchAllProducts(),
          );
        } else if (state is GetProductsSuccessState) {
          return buildProductsList(
            allProductsName: state.products.map((c) => c.productName).toList(),
            allProductsDescription:
                state.products.map((c) => c.productDescription).toList(),
            context: context,
          );
        } else {
          // Handle other cases
          return showToast(false, "Error", "Something Went Wrong");
        }
      },
    );
  }

  Widget buildProductsList({
    required List<String> allProductsName,
    required List<String> allProductsDescription,
    required BuildContext context,
  }) {
    final List<String> productImages = [
      AppImages.khatwaImage,
      AppImages.meshwarImage,
      AppImages.sanaahImage,
      AppImages.naqlaImage,
      AppImages.fekraImage,
      AppImages.koudraImage,
      AppImages.beeyeyImage,
      AppImages.shahanaImage,
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(
        left: AppDimensions.paddingSizeLarge,
        right: AppDimensions.paddingSizeLarge,
      ),
      itemCount: allProductsName.length,
      itemBuilder: (context, index) {
        return CustomProductsListViewItem(
          productName: allProductsName[index],
          productDescrption: allProductsDescription[index],
          imagePath:
              productImages[index % productImages.length], // safe indexing
        );
      },
    );
  }
}
