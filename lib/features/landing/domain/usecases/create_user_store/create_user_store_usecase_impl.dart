import 'package:artuaista/core/constants/store.dart';
import 'package:artuaista/core/domain/services/store_service.dart';
import 'package:artuaista/features/landing/domain/usecases/create_user_store/create_user_store_usecase.dart';

class CreateUserStoreUsecaseImpl implements CreateUserStoreUsecase {
  final StoreService _storeService;

  CreateUserStoreUsecaseImpl(this._storeService);

  @override
  Future<void> call() async {
    String userDataKey = StoreConstants.STORE_USER_DATA;
    String passLandingKey = StoreConstants.STOREKEY_USER_DATA_PassLanding;

    Map initialUserStore = {
      passLandingKey: true,
    };

    await _storeService.setItem(userDataKey, initialUserStore);
  }
}
