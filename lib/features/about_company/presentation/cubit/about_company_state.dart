part of 'about_company_cubit.dart';

abstract class AboutCompanyState {}

class AboutCompanyInitialState extends AboutCompanyState {}

class GetAboutCompanyLoadingState extends AboutCompanyState {}

class GetAboutCompanySuccessState extends AboutCompanyState {
  final List<AboutCompanyEntity> aboutCompany;
  GetAboutCompanySuccessState(this.aboutCompany);
}

class GetAboutCompanyFailureState extends AboutCompanyState {
  final String error;
  GetAboutCompanyFailureState({required this.error});
}
