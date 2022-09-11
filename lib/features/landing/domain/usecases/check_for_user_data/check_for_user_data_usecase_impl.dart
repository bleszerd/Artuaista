import 'package:artuaista/features/landing/domain/repositories/check_for_user_data_repository.dart';
import 'package:artuaista/features/landing/domain/usecases/check_for_user_data/check_for_user_data_usecase.dart';

class CheckForUserDataUsecaseImpl implements CheckForUserDataUsecase {
  final CheckForUserDataRepository _checkForUserDataRepository;

  CheckForUserDataUsecaseImpl(this._checkForUserDataRepository);

  @override
  Future<bool> call() async {
    return await _checkForUserDataRepository();
  }
}
