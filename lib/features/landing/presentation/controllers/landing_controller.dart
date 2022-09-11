import 'package:artuaista/features/landing/domain/usecases/check_for_user_data/check_for_user_data_usecase.dart';
import 'package:artuaista/features/landing/domain/usecases/create_user_store/create_user_store_usecase.dart';

class LandingController {
  final CreateUserStoreUsecase _createUserStoreUsecase;
  final CheckForUserDataUsecase _checkForUserDataUsecase;

  LandingController(
    this._createUserStoreUsecase,
    this._checkForUserDataUsecase,
  );

  Future<void> createUserStore() async {
    await _createUserStoreUsecase();
  }

  void checkForUserData(Function(bool hasData) callback) async {
    bool hasData = await _checkForUserDataUsecase();

    callback(hasData);
  }
}
