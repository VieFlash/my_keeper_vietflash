// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:native_shared_preferences/native_shared_preferences.dart'
    as _i3;

import '../../common/services/common_services.dart' as _i13;
import '../../data/local/pref/app_pref_impl.dart' as _i9;
import '../../data/remote/service/api_service.dart' as _i6;
import '../../data/remote/service/authentication_service.dart' as _i7;
import '../../data/repository/auth_repository_impl.dart' as _i11;
import '../../domain/local/pref/app_pref.dart' as _i8;
import '../../domain/repository/auth_repository.dart' as _i10;
import '../../domain/usecase/login_use_case.dart' as _i12;
import '../../presentation/views/login_view/bloc/login_bloc.dart' as _i15;
import '../../presentation/views/splash/controller/splash_controller.dart'
    as _i14;
import '../../presentation/widgets/common_gaps.dart' as _i5;
import 'app_module.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.singletonAsync<_i3.NativeSharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.singleton<_i4.Dio>(() => appModule.dio);
  gh.singleton<_i5.Gaps>(() => _i5.Gaps());
  gh.singleton<_i6.ApiService>(() => _i6.ApiService(gh<_i4.Dio>()));
  gh.singleton<_i7.AuthenticationService>(
      () => _i7.AuthenticationService(gh<_i4.Dio>()));
  gh.singleton<_i8.AppPref>(
      () => _i9.AppPrefImpl(gh<_i3.NativeSharedPreferences>()));
  gh.singleton<_i10.AuthRepository>(
      () => _i11.AuthRepositoryImpl(gh<_i7.AuthenticationService>()));
  gh.factory<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(gh<_i10.AuthRepository>()));
  gh.singleton<_i13.CommonServices>(
      () => _i13.CommonServices(gh<_i8.AppPref>()));
  gh.factory<_i14.SplashController>(
      () => _i14.SplashController(gh<_i8.AppPref>()));
  gh.factory<_i15.LoginBloc>(() => _i15.LoginBloc(
        gh<_i12.LoginUseCase>(),
        gh<_i8.AppPref>(),
      ));
  return getIt;
}

class _$AppModule extends _i16.AppModule {}
