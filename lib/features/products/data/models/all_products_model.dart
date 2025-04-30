
import '../../../../core/api/endpoints.dart';
import 'sub_models/product_details.dart';

class AllProductsModel  {
  final List<ProductsDetails> products;
  final String message;
  final String status;

  AllProductsModel({
    required this.products,
    required this.message,
    required this.status,
  });

  // Factory method to create an Order from a map (used for JSON parsing)
  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      products: (json[ApiKey.products] as List<dynamic>)
          .map((order) => ProductsDetails.fromJson(order))
          .toList(),
      message: json[ApiKey.message],
      status: json[ApiKey.status],
    );
  }
}
