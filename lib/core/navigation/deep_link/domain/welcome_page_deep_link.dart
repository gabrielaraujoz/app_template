import 'package:app_template/core/navigation/deep_link/deep_link.dart';
import 'package:app_template/core/navigation/destination.dart';

class WelcomePageDeepLink extends DeepLink {
  @override
  bool get authRequired => false;

  @override
  final String path = PATH;

  @override
  List<Destination> Function(Uri? uri) get destinationFactory => (uri) => [
        Destination.welcome(),
      ];

  // ignore: constant_identifier_names
  static const String PATH = '';
}
