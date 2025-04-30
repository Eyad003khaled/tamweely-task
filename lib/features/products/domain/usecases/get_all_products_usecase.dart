import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/products_entity.dart';
import '../repositories/products_repository.dart';



class GetAllProductsUseCase {
  final ProductsRepository repository;

  GetAllProductsUseCase({required this.repository});
  Future<Either<Failure, List<ProductsEntity>>> call() async {
    return await repository.getAllProducts();
  }
}
