import 'package:artuaista/core/constants/store.dart';
import 'package:artuaista/core/domain/services/store_service.dart';
import 'package:artuaista/features/landing/data/datasource/check_for_user_data_datasource.dart';

class CheckForUserDataLocalSharedprefsDatasourceImpl
    implements CheckForUserDataDatasource {
  final StoreService _storeService;

  CheckForUserDataLocalSharedprefsDatasourceImpl(this._storeService);

  @override
  Future<bool> call() async {
    var hasUserData =
        await _storeService.hasKey(StoreConstants.STORE_USER_DATA);

    print('hasKey $hasUserData');

    return hasUserData;
  }
}
