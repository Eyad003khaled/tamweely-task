
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/all_about_company_model.dart';

class AboutCompanyRemoteDataSource {
  final ApiConsumer api;

  AboutCompanyRemoteDataSource({required this.api});

  Future<AllAboutCompanyModel> getAllAboutCompany()async {
    try {
      final response = await api.get(Endpoints.aboutCompany);
      return  AllAboutCompanyModel.fromJson(response);
    } catch (error) {

      throw ServerException(
        errorModel: ErrorModel(
          errorMessage: 'Failed to fetch All AboutCompany: ${error.toString()}', status: false,
        ),
      );
    }
  }
}
