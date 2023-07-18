import 'package:app_template/core/navigation/deep_link/domain/welcome_page_deep_link.dart';
import 'package:equatable/equatable.dart';

import '../destination.dart';

abstract class DeepLink extends Equatable {
  abstract final String path;
  final bool authRequired = true;

  /// This is expected to return a nullable list because the uri might not be valid. Therefore
  /// the expected result is to go the default deep link
  abstract final List<Destination>? Function(Uri? uri) destinationFactory;

  final Map<String, DeepLink> innerDeepLinks = {};

  @override
  List<Object> get props => [path, authRequired];

  Uri get uri => Uri.parse('${DeepLink.SCHEME}://$path');

  static Map<String, DeepLink> deepLinks = {
    // template-app://
    WelcomePageDeepLink.PATH: WelcomePageDeepLink(),
  };

  static DeepLink defaultLoggedPage = deepLinks[WelcomePageDeepLink.PATH]!;

  static const String SCHEME = 'template-app';
}
