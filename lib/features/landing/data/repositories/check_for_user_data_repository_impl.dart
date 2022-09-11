import 'package:artuaista/features/landing/data/datasource/check_for_user_data_datasource.dart';
import 'package:artuaista/features/landing/domain/repositories/check_for_user_data_repository.dart';

class CheckForUserDataRepositoryImpl implements CheckForUserDataRepository {
  final CheckForUserDataDatasource _checkForUserDataDatasource;

  CheckForUserDataRepositoryImpl(this._checkForUserDataDatasource);

  @override
  Future<bool> call() async {
    return await _checkForUserDataDatasource();
  }
}
