import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_initializer.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void setupDependencyInjection() {
  getIt.init();
}
