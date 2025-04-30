
import '../../../../../core/api/endpoints.dart';
import '../../../domain/entities/products_entity.dart';

class ProductsDetails extends ProductsEntity {


  ProductsDetails({
    required super.productName,
    required super.productDescription,

  });

  // Factory method to create an Order from a map (used for JSON parsing)
  factory ProductsDetails.fromJson(Map<String, dynamic> json) {
    return ProductsDetails(
      productName: json[ApiKey.productName],
      productDescription: json[ApiKey.productDescription],

    );
  }
}
