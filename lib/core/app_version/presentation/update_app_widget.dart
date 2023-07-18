import 'package:app_template/core/app_version/presentation/update_app_widget_controller.dart';
import 'package:app_template/core/di/injection_initializer.dart';
import 'package:app_template/core/theme/widgets/global_app_theme.dart';
import 'package:app_template/core/tokens/dimensions.dart';
import 'package:app_template/core/widgets/custom_contained_button.dart';
import 'package:app_template/core/widgets/safe_image.dart';
import 'package:flutter/material.dart';

class UpdateAppWidget extends StatelessWidget {
  final UpdateAppWidgetController controller;
  final String description;

  const UpdateAppWidget._({
    required this.controller,
    required this.description,
  });

  factory UpdateAppWidget.create({
    required String description,
  }) =>
      UpdateAppWidget._(
        controller: getIt<UpdateAppWidgetController>(),
        description: description,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.base6),
      color: GlobalAppTheme.of(context).surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.base6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SafeImage(
                assetName: 'app_logo', //TODO: replace
                size: Size.fromHeight(Dimensions.base8),
              ),
            ),
          ),
          const Expanded(
            child: SafeImage(
              assetName: 'minimum_version',
              keepAssetOriginalSize: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.base6),
            child: Text(
              'Opa, parece que temos uma nova versão para você!',
              style: GlobalAppTheme.of(context).txTitle2He,
            ),
          ),
          Text(
            description,
            style: GlobalAppTheme.of(context).txBody,
          ),
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.base6),
            child: CustomContainedButton(
              text: 'Baixar novo app',
              onPressed: controller.onUpdateButtonPressed,
            ),
          )
        ],
      ),
    );
  }
}
