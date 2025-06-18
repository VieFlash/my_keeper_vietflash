// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:native_shared_preferences/native_shared_preferences.dart'
    as _i5;

import '../../common/services/common_services.dart' as _i4;
import '../../presentation/views/notebook_view/notebook_controller.dart' as _i3;
import '../../presentation/widgets/common_gaps.dart' as _i6;
import 'app_module.dart' as _i7;

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
  gh.factory<_i3.NoteBookController>(() => _i3.NoteBookController());
  gh.singleton<_i4.CommonServices>(() => _i4.CommonServices());
  await gh.singletonAsync<_i5.NativeSharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.singleton<_i6.Gaps>(() => _i6.Gaps());
  return getIt;
}

class _$AppModule extends _i7.AppModule {}
