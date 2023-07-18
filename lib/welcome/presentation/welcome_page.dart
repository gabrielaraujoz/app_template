import 'package:app_template/core/tokens/dimensions.dart';
import 'package:app_template/welcome/presentation/welcome_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:injectable/injectable.dart';

@injectable
class WelcomePage extends StatefulWidget {
  final WelcomePageViewModel _viewModel;

  // ignore: use_key_in_widget_constructors
  const WelcomePage(
    this._viewModel,
  );

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: Dimensions.base6),
        child: Observer(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: Text('Welcome Page')),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.base6,
                  ),
                  child: ElevatedButton(
                    onPressed: widget._viewModel.onStartButtonClicked,
                    child: const Text('start something'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
