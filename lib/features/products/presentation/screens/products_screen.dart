import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamweely_task/features/products/presentation/widgets/sections/products_section.dart';

import '../../../../core/services/injection.dart';
import '../cubit/products_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<ProductsCubit>()..fetchAllProducts(),
      child: const ProductsSection(),
    );
  }
}
