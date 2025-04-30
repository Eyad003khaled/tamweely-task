import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/products_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsEntity>>> getAllProducts();
}



