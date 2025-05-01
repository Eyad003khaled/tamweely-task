
import '../../../../../core/api/endpoints.dart';
import '../../../domain/entities/about_company_entity.dart';

class AboutCompanyDetails extends AboutCompanyEntity {


  AboutCompanyDetails({
    required super.companyOverview,
    required super.companyMission,
    required super.companyVision,
  });

  // Factory method to create an Order from a map (used for JSON parsing)
  factory AboutCompanyDetails.fromJson(Map<String, dynamic> json) {
    return AboutCompanyDetails(
      companyOverview: json[ApiKey.companyOverview],
      companyMission: json[ApiKey.companyMission],
      companyVision: json[ApiKey.companyVision],

    );
  }
}
