import 'package:injectable/injectable.dart';
import 'package:my_keeper_vietflash/domain/usecase/usecase.dart';

import '../local/pref/app_pref.dart';

@injectable
class GetTokenUseCase extends NoParamUseCase {
  final AppPref _pref;

  GetTokenUseCase(this._pref);

  @override
  Future<String> call() async {
    return await _pref.accessToken;
  }
}
