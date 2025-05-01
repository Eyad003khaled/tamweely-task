import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static String baseUrl = dotenv.env['API_BASE_URL']!;
  static String products = "cee5d5f0-968a-48e2-8003-70a93faa1f95";
  static String aboutCompany = "933c29f8-9ecc-4d5b-8475-b9410a1f8d7f";
}

class ApiKey {
  static String productName = "product_name";
  static String productDescription = "product_description";
  static String status = "status";
  static String message = "message";
  static String products = "products";
  static String aboutCompany = "about_company";
  static String companyOverview = "company_overview";
  static String companyMission = "company_mission";
  static String companyVision = "company_vision";
}
