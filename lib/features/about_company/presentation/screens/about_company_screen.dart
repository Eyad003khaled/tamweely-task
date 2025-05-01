import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/injection.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubit/about_company_cubit.dart';
import '../widgets/about_company_widget.dart';

class AboutCompanyScreen extends StatelessWidget {
  const AboutCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<AboutCompanyCubit>()..fetchAllAboutCompany(),
      child: const Scaffold(
          appBar: CustomAppBar(title: AppStrings.aboutCompany),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.paddingSizeExtraLarge,
                right: AppDimensions.paddingSizeExtraLarge,
              ), child: AboutCompanyWidget())))
    );
  }
}
