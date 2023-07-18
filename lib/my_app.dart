import 'package:app_template/core/navigation/navigator/app_router_delegate.dart';
import 'package:app_template/my_app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MyApp extends StatefulWidget {
  final MyAppViewModel viewModel;
  final AppRouterDelegate appRouterDelegate;

  // ignore: use_key_in_widget_constructors
  const MyApp(
    this.viewModel,
    this.appRouterDelegate,
  );

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.onViewReady();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: AppTypography.baseFont,
      //   scaffoldBackgroundColor: AppColors.neutralBlank,
      //   highlightColor: AppColors.neutralBlankTransparent,
      //   splashColor: AppColors.neutralBase12,
      //   snackBarTheme: SnackBarThemeData(
      //     contentTextStyle: AppTheme.of(context).txBodySmall.copyWith(
      //           color: AppColors.neutralBlank,
      //         ),
      //   ),
      // ),
      routerDelegate: widget.appRouterDelegate,
    );
  }
}
