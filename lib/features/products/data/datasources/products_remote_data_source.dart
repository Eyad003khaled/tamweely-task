
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/all_products_model.dart';

class ProductsRemoteDataSource {
  final ApiConsumer api;

  ProductsRemoteDataSource({required this.api});

  Future<AllProductsModel> getAllProducts()async {
    try {
      final response = await api.get(Endpoints.products);
      return  AllProductsModel.fromJson(response);
    } catch (error) {

      throw ServerException(
        errorModel: ErrorModel(
          errorMessage: 'Failed to fetch All Products: ${error.toString()}', status: false,
        ),
      );
    }
  }
}
