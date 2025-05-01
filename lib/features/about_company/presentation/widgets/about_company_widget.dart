import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamweely_task/core/utils/app_assets.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/redacted/custom_redacted_about_company.dart';
import 'package:tamweely_task/features/about_company/presentation/widgets/sections/company_info.dart';
import '../../../../core/errors/no_internet_connection.dart';
import '../../../../core/functions/toast/custom_toast.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../cubit/about_company_cubit.dart';
import 'sections/google_maps.dart';
import 'sections/poster.dart';

class AboutCompanyWidget extends StatelessWidget {
  const AboutCompanyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCompanyCubit, AboutCompanyState>(
        builder: (context, state) {
      if (state is GetAboutCompanyLoadingState) {
        // Return redacted version while loading

        return const CustomRedactedAboutCompany();
      } else if (state is GetAboutCompanyFailureState) {
        // Handle failure state
        return NoInternetConnection(
          fetchDataCallback: () => BlocProvider.of<AboutCompanyCubit>(context)
              .fetchAllAboutCompany(),
        );
      } else if (state is GetAboutCompanySuccessState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppDimensions.paddingSizeExtraLarge,
            ),
            ZoomIn(
                child: const Poster(
              imagePath: AppImages.imagesCompanyPoster,
            )),
            const SizedBox(
              height: AppDimensions.paddingSizeExtraLarge,
            ),
            FadeIn(
              child: CompanyInfo(
                title: AppStrings.companyOverview,
                description: state.aboutCompany[0].companyOverview,
              ),
            ),
            const SizedBox(
              height: AppDimensions.paddingSizeExtraLarge,
            ),
            FadeIn(
              child: CompanyInfo(
                  title: AppStrings.mission,
                  description: state.aboutCompany[0].companyMission),
            ),
            const SizedBox(
              height: AppDimensions.paddingSizeExtraLarge,
            ),
            FadeIn(
              child: CompanyInfo(
                  title: AppStrings.vision,
                  description: state.aboutCompany[0].companyVision),
            ),
            const SizedBox(
              height: AppDimensions.paddingSizeExtraLarge,
            ),
            const SizedBox(
                height: 250, width: double.infinity, child: StaticMapScreen()),
            const SizedBox(
              height: AppDimensions.paddingSizeExtraLarge,
            ),
          ],
        );
      } else {
        return showToast(false, "Error", "Something Went Wrong");
      }
    });
  }
}
