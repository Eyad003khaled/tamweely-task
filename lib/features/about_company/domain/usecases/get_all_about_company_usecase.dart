import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/about_company_entity.dart';
import '../repositories/about_company_repository.dart';




class GetAllAboutCompanyUseCase {
  final AboutCompanyRepository repository;

  GetAllAboutCompanyUseCase({required this.repository});
  Future<Either<Failure, List<AboutCompanyEntity>>> call() async {
    return await repository.getAllAboutCompany();
  }
}
