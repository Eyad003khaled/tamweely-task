import 'package:dartz/dartz.dart';
import '../../../../../connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/about_company_entity.dart';
import '../../domain/repositories/about_company_repository.dart';
import '../datasources/about_company_local_data_source.dart';
import '../datasources/about_company_remote_data_source.dart';


class AboutCompanyRepositoryImpl implements AboutCompanyRepository {
  final NetworkInfo networkInfo;
  final AboutCompanyRemoteDataSource aboutCompanyRemoteDataSource;
  final AboutCompanyLocalDataSource localDataSource;

  // Flag to check if data has been fetched remotely
  bool _isDataFetchedOnce = false;

  AboutCompanyRepositoryImpl({
    required this.networkInfo,
    required this.aboutCompanyRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<AboutCompanyEntity>>> getAllAboutCompany() async {
    try {
      //  If data is already fetched, use cached data
      if (_isDataFetchedOnce) {
        final localAboutCompany = await localDataSource.getLastAboutCompany();

        return Right(localAboutCompany);
      }

      final isConnected = await networkInfo.isConnected ?? false;
      if (isConnected) {
        // Fetch data from the remote data source
        final allAboutCompanyModel = await aboutCompanyRemoteDataSource.getAllAboutCompany();

        // Map the `aboutCompany` list from `Data` into a list of `AboutCompanyEntity`
        final broducts = allAboutCompanyModel.aboutCompany.map((aboutCompany) {
          return AboutCompanyEntity(
            companyOverview: aboutCompany.companyOverview, 
              companyMission: aboutCompany.companyMission,
              companyVision: aboutCompany.companyVision,
            // Add other properties as needed
          );
        }).toList();
        // Cache the aboutCompany locally
        localDataSource.cacheAboutCompany(broducts);

        // Mark that the data has been fetched remotely
        _isDataFetchedOnce = true;

        return Right(broducts);
      } else {
        // Retrieve data from the local data source
        final localAboutCompany = await localDataSource.getLastAboutCompany();

        return Right(localAboutCompany);
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
