import 'package:dartz/dartz.dart';
import '../../../../../connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/products_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_local_data_source.dart';
import '../datasources/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final NetworkInfo networkInfo;
  final ProductsRemoteDataSource productsRemoteDataSource;
  final ProductsLocalDataSource localDataSource;

  // Flag to check if data has been fetched remotely
  bool _isDataFetchedOnce = false;

  ProductsRepositoryImpl({
    required this.networkInfo,
    required this.productsRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<ProductsEntity>>> getAllProducts() async {
    try {
      //  If data is already fetched, use cached data
      if (_isDataFetchedOnce) {
        final localProducts = await localDataSource.getLastProducts();

        return Right(localProducts);
      }

      final isConnected = await networkInfo.isConnected ?? false;
      if (isConnected) {
        // Fetch data from the remote data source
        final allProductsModel = await productsRemoteDataSource.getAllProducts();

        // Map the `products` list from `Data` into a list of `ProductsEntity`
        final broducts = allProductsModel.products.map((brand) {
          return ProductsEntity(
            productName: brand.productName,
            productDescription: brand.productDescription,
            // Add other properties as needed
          );
        }).toList();
        // Cache the products locally
        localDataSource.cacheProducts(broducts);

        // Mark that the data has been fetched remotely
        _isDataFetchedOnce = true;

        return Right(broducts);
      } else {
        // Retrieve data from the local data source
        final localProducts = await localDataSource.getLastProducts();

        return Right(localProducts);
      }
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on CacheException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    } catch (e) {
      return Left(
          Failure(errMessage: "Unexpected error occurred: ${e.toString()}"));
    }
  }
}
