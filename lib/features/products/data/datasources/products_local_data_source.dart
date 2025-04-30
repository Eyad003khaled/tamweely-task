import 'dart:convert';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../core/api/endpoints.dart';
import '../../domain/entities/products_entity.dart';


class ProductsLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedProducts";
  
  ProductsLocalDataSource({required this.cache});

  void cacheProducts(List<ProductsEntity> productsToCache) {
    final productsJson = productsToCache.map((product) {
      return {
        ApiKey.productName: product.productName,
        ApiKey.productDescription: product.productDescription,
      };
    }).toList();

    cache.saveData(
      key: key,
      value: json.encode(productsJson),
    );
  }

  Future<List<ProductsEntity>> getLastProducts() async {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      final products = decodedJson.map((product) {
        return ProductsEntity(
          productName: product[ApiKey.productName],
          productDescription: product[ApiKey.productDescription],
          
        );
      }).toList();
      return Future.value(products);
    } else {
      throw CacheException(
        errorMessage: AppStrings.noInternetTitle,
      );
    }
  }
}
