
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/functions/toast/custom_toast.dart';
import '../../../../core/services/injection.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/about_company_entity.dart';
import '../../domain/usecases/get_all_about_company_usecase.dart';


part 'about_company_state.dart';

class AboutCompanyCubit extends Cubit<AboutCompanyState> {
  final GetAllAboutCompanyUseCase getAllAboutCompanyUseCase;

  AboutCompanyCubit() : getAllAboutCompanyUseCase = getIt<GetAllAboutCompanyUseCase>(), super(AboutCompanyInitialState());

  Future<void> fetchAllAboutCompany() async {
    try{
    emit(GetAboutCompanyLoadingState());
    final aboutCompany = await getAllAboutCompanyUseCase.call();

    aboutCompany.fold(
      (failure) => _handleFailure(failure),
      (aboutCompany) => emit(GetAboutCompanySuccessState(aboutCompany)),
    );
    }
    catch (e) {
      _handleUnexpectedError(e);
    }
  }
    void _handleFailure(dynamic failure) {
    showToast(false, AppStrings.noInternetTitle,
      AppStrings.noInternetSubtitle);
    emit(GetAboutCompanyFailureState(error: failure.errMessage));
    if (kDebugMode) {
      print(failure.errMessage);
    }
  }
  void _handleUnexpectedError(dynamic error) {
  //  showToast(false, "Loading Data Failed", 'Unexpected error: ${error.toString()}');
    emit(GetAboutCompanyFailureState(error: 'Unexpected error: ${error.toString()}'));
    if (kDebugMode) {
      print('Unexpected error: ${error.toString()}');
    }
  }
}