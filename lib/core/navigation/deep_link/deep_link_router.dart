import 'package:app_template/core/navigation/deep_link/data/destination_repository.dart';
import 'package:app_template/core/navigation/deep_link/deep_link.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeepLinkRouter {
  final DestinationRepository destinationRepository;

  DeepLinkRouter({
    required this.destinationRepository,
  });

  bool isKnownDeepLink(Uri uri) {
    if (uri.scheme != DeepLink.SCHEME) return false;
    final deepLink = DeepLink.deepLinks[uri.host];
    return deepLink != null && deepLink.destinationFactory(uri) != null;
  }

  List<Destination> getDestinations(Uri? uri) {
    final path = uri?.host;
    final deepLink = DeepLink.deepLinks[path];

    if (deepLink == null) {
      return DeepLink.defaultLoggedPage.destinationFactory(null)!;
    } else {
      return deepLink.destinationFactory(uri) ??
          DeepLink.defaultLoggedPage.destinationFactory(uri)!;
    }
  }

  Type getDestinationRuntimeType(Uri uri) {
    final destinations = getDestinations(uri);
    return destinations.last.runtimeType;
  }
}
