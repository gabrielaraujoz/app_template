// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_template/core/di/core_module.dart' as _i25;
import 'package:app_template/core/error/domain/error_message_mapper.dart'
    as _i5;
import 'package:app_template/core/firebase/firebase_initializer.dart' as _i6;
import 'package:app_template/core/logger/app_error_logger.dart' as _i3;
import 'package:app_template/core/logger/app_error_logger_initializer.dart'
    as _i17;
import 'package:app_template/core/logger/crashlytics_wrapper.dart' as _i12;
import 'package:app_template/core/logger/di/logger_module.dart' as _i26;
import 'package:app_template/core/meta_info/meta_info.dart' as _i10;
import 'package:app_template/core/navigation/deep_link/data/destination_repository.dart'
    as _i13;
import 'package:app_template/core/navigation/deep_link/deep_link_router.dart'
    as _i18;
import 'package:app_template/core/navigation/navigator/app_navigator.dart'
    as _i20;
import 'package:app_template/core/navigation/navigator/app_router_delegate.dart'
    as _i19;
import 'package:app_template/core/network/di/network_module.dart' as _i27;
import 'package:app_template/core/network/error_interceptor.dart' as _i4;
import 'package:app_template/core/network/headers_builder.dart' as _i14;
import 'package:app_template/core/network/headers_interceptor.dart' as _i15;
import 'package:app_template/core/remote_config/remote_config_service.dart'
    as _i16;
import 'package:app_template/my_app.dart' as _i23;
import 'package:app_template/my_app_view_model.dart' as _i21;
import 'package:app_template/splash/presentation/splash_page.dart' as _i11;
import 'package:app_template/welcome/presentation/welcome_page.dart' as _i24;
import 'package:app_template/welcome/presentation/welcome_page_view_model.dart'
    as _i22;
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_fimber/flutter_fimber.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.AppErrorLogger>(() => _i3.AppErrorLogger());
    gh.lazySingleton<_i4.ErrorInterceptor>(() => _i4.ErrorInterceptor());
    gh.lazySingleton<_i5.ErrorMessageMapper>(() => _i5.ErrorMessageMapper());
    gh.factory<_i6.FirebaseInitializer>(() => _i6.FirebaseInitializer());
    gh.lazySingleton<_i7.FlutterSecureStorage>(() => coreModule.secureStorage);
    gh.lazySingleton<_i8.Interceptor>(
      () => loggerModule.httpFormatter,
      instanceName: 'networkLoggerInterceptor',
    );
    gh.lazySingleton<_i9.LogTree>(
      () => loggerModule.logTree,
      instanceName: 'debugTree',
    );
    gh.lazySingleton<_i10.MetaInfo>(() => _i10.MetaInfo());
    gh.factory<_i11.SplashPage>(() => _i11.SplashPage());
    gh.lazySingleton<String>(
      () => coreModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<bool>(
      () => coreModule.isDebug,
      instanceName: 'isDebug',
    );
    gh.lazySingleton<int>(
      () => coreModule.remoteConfigFetchIntervalMinutes,
      instanceName: 'remoteConfigFetchIntervalMinutes',
    );
    gh.lazySingleton<_i12.CrashlyticsWrapper>(
        () => _i12.CrashlyticsWrapper(gh<bool>(instanceName: 'isDebug')));
    gh.lazySingleton<_i13.DestinationRepository>(
        () => _i13.DestinationRepository(gh<_i7.FlutterSecureStorage>()));
    gh.lazySingleton<_i8.Dio>(() => networkModule.dio(
          gh<String>(instanceName: 'baseUrl'),
          gh<bool>(instanceName: 'isDebug'),
        ));
    gh.lazySingleton<_i8.Dio>(
      () => networkModule.logoutDio(
        gh<String>(instanceName: 'baseUrl'),
        gh<bool>(instanceName: 'isDebug'),
      ),
      instanceName: 'logoutDio',
    );
    gh.factory<_i14.HeadersBuilder>(
        () => _i14.HeadersBuilder(gh<_i10.MetaInfo>()));
    gh.lazySingleton<_i15.HeadersInterceptor>(
        () => _i15.HeadersInterceptor(gh<_i14.HeadersBuilder>()));
    gh.lazySingleton<_i16.RemoteConfigService>(() => _i16.RemoteConfigService(
        remoteConfigFetchIntervalMinutes:
            gh<int>(instanceName: 'remoteConfigFetchIntervalMinutes')));
    gh.lazySingleton<_i17.AppErrorLoggerInitializer>(
        () => _i17.AppErrorLoggerInitializer(
              crashlyticsWrapper: gh<_i12.CrashlyticsWrapper>(),
              debugTree: gh<_i9.LogTree>(instanceName: 'debugTree'),
              isDebug: gh<bool>(instanceName: 'isDebug'),
            ));
    gh.lazySingleton<_i18.DeepLinkRouter>(() => _i18.DeepLinkRouter(
        destinationRepository: gh<_i13.DestinationRepository>()));
    gh.lazySingleton<_i19.AppRouterDelegate>(
        () => _i19.AppRouterDelegate(gh<_i18.DeepLinkRouter>()));
    gh.lazySingleton<_i20.AppNavigator>(
        () => coreModule.navigator(gh<_i19.AppRouterDelegate>()));
    gh.lazySingleton<_i21.MyAppViewModel>(() => _i21.MyAppViewModel(
          gh<_i12.CrashlyticsWrapper>(),
          gh<_i10.MetaInfo>(),
          gh<_i20.AppNavigator>(),
        ));
    gh.factory<_i22.WelcomePageViewModel>(
        () => _i22.WelcomePageViewModel(gh<_i20.AppNavigator>()));
    gh.lazySingleton<_i23.MyApp>(() => _i23.MyApp(
          gh<_i21.MyAppViewModel>(),
          gh<_i19.AppRouterDelegate>(),
        ));
    gh.factory<_i24.WelcomePage>(
        () => _i24.WelcomePage(gh<_i22.WelcomePageViewModel>()));
    return this;
  }
}

class _$CoreModule extends _i25.CoreModule {}

class _$LoggerModule extends _i26.LoggerModule {}

class _$NetworkModule extends _i27.NetworkModule {}
