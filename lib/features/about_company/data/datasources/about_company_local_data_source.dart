import 'dart:convert';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../core/api/endpoints.dart';
import '../../domain/entities/about_company_entity.dart';

class AboutCompanyLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedAboutCompany";

  AboutCompanyLocalDataSource({required this.cache});

  void cacheAboutCompany(List<AboutCompanyEntity> aboutCompanyToCache) {
    // We store only the first object, since the list is always of size 1
    final aboutCompany = aboutCompanyToCache.first;

    final aboutCompanyJson = {
      ApiKey.companyOverview: aboutCompany.companyOverview,
      ApiKey.companyMission: aboutCompany.companyMission,
      ApiKey.companyVision: aboutCompany.companyVision,
    };

    cache.saveData(
      key: key,
      value: json.encode(aboutCompanyJson),
    );
  }

  Future<List<AboutCompanyEntity>> getLastAboutCompany() async {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final Map<String, dynamic> decodedJson = json.decode(jsonString);

      final aboutCompany = AboutCompanyEntity(
        companyOverview: decodedJson[ApiKey.companyOverview],
        companyMission: decodedJson[ApiKey.companyMission],
        companyVision: decodedJson[ApiKey.companyVision],
      );

      // Wrap in a list to match repository return type
      return Future.value([aboutCompany]);
    } else {
      throw CacheException(
        errorMessage: AppStrings.noInternetTitle,
      );
    }
  }
}
