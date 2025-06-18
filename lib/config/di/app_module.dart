import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';
import 'app_module.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => $initGetIt(serviceLocator);

@module
@Singleton()
abstract class AppModule {
  @preResolve
  @Singleton()
  Future<NativeSharedPreferences> get sharedPreferences =>
      NativeSharedPreferences.getInstance();
}
