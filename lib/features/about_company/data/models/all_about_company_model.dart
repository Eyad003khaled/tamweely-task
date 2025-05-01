import '../../../../core/api/endpoints.dart';
import 'sub_models/about_company_details.dart';

class AllAboutCompanyModel {
  final List<AboutCompanyDetails> aboutCompany;
  final String message;
  final String status;

  AllAboutCompanyModel({
    required this.aboutCompany,
    required this.message,
    required this.status,
  });

  // Factory method to create an Order from a map (used for JSON parsing)
  factory AllAboutCompanyModel.fromJson(Map<String, dynamic> json) {
    return AllAboutCompanyModel(
      aboutCompany: (json[ApiKey.aboutCompany] as List<dynamic>)
          .map((aboutCompany) => AboutCompanyDetails.fromJson(aboutCompany))
          .toList(),
      message: json[ApiKey.message],
      status: json[ApiKey.status],
    );
  }
}
