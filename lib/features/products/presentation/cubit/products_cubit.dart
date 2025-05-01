
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/functions/toast/custom_toast.dart';
import '../../../../core/services/injection.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/products_entity.dart';
import '../../domain/usecases/get_all_products_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  ProductsCubit() : getAllProductsUseCase = getIt<GetAllProductsUseCase>(), super(ProductsInitialState());

  Future<void> fetchAllProducts() async {
    try{
    emit(GetProductsLoadingState());
    final products = await getAllProductsUseCase.call();

    products.fold(
      (failure) => _handleFailure(failure),
      (products) => emit(GetProductsSuccessState(products)),
    );
    }
    catch (e) {
      _handleUnexpectedError(e);
    }
  }
    void _handleFailure(dynamic failure) {
    showToast(false, AppStrings.noInternetTitle,
      AppStrings.noInternetSubtitle);
    emit(GetProductsFailureState(error: failure.errMessage));
    if (kDebugMode) {
      print(failure.errMessage);
    }
  }
  void _handleUnexpectedError(dynamic error) {
  //  showToast(false, "Loading Data Failed", 'Unexpected error: ${error.toString()}');
    emit(GetProductsFailureState(error: 'Unexpected error: ${error.toString()}'));
    if (kDebugMode) {
      print('Unexpected error: ${error.toString()}');
    }
  }
}