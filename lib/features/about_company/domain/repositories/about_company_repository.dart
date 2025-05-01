import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/about_company_entity.dart';

abstract class AboutCompanyRepository {
  Future<Either<Failure, List<AboutCompanyEntity>>> getAllAboutCompany();
}



