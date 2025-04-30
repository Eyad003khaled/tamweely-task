part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class GetProductsLoadingState extends ProductsState {}

class GetProductsSuccessState extends ProductsState {
  final List<ProductsEntity> products;
  GetProductsSuccessState(this.products);
}

class GetProductsFailureState extends ProductsState {
  final String error;
  GetProductsFailureState({required this.error});
}
