import 'package:app_template/core/app_version/presentation/update_app_widget.dart';
import 'package:app_template/core/theme/app_theme.dart';
import 'package:app_template/core/theme/widgets/theme_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MinimumVersionPage extends StatefulWidget {
  @override
  State<MinimumVersionPage> createState() => _MinimumVersionPageState();
}

class _MinimumVersionPageState extends State<MinimumVersionPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ThemeWrapper(
      theme: AppTheme(context),
      builder: (context) => Scaffold(
        body: SafeArea(
          child: UpdateAppWidget.create(
            description:
                'Parece que a versão do seu aplicativo está desatualizada. Por favor, atualize para continuar utilizando.',
          ),
        ),
      ),
    );
  }
}
