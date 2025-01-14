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

import '../../common/services/common_services.dart' as _i3;
import '../../data/remote/service/api_service.dart' as _i6;
import '../../data/remote/service/authentication_service.dart' as _i7;
import '../../data/repository/auth_repository_impl.dart' as _i9;
import '../../domain/repository/auth_repository.dart' as _i8;
import '../../domain/usecase/login_use_case.dart' as _i10;
import '../../presentation/views/login_view/bloc/login_bloc.dart' as _i11;
import '../../presentation/widgets/common_gaps.dart' as _i5;
import 'app_module.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.CommonServices>(() => _i3.CommonServices());
  gh.singleton<_i4.Dio>(() => appModule.dio);
  gh.singleton<_i5.Gaps>(() => _i5.Gaps());
  gh.singleton<_i6.ApiService>(() => _i6.ApiService(gh<_i4.Dio>()));
  gh.singleton<_i7.AuthenticationService>(
      () => _i7.AuthenticationService(gh<_i4.Dio>()));
  gh.singleton<_i8.AuthRepository>(
      () => _i9.AuthRepositoryImpl(gh<_i7.AuthenticationService>()));
  gh.factory<_i10.LoginUseCase>(
      () => _i10.LoginUseCase(gh<_i8.AuthRepository>()));
  gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(gh<_i10.LoginUseCase>()));
  return getIt;
}

class _$AppModule extends _i12.AppModule {}
