
import '../../../core/networking/api_endpoint.dart';
import '../../../core/networking/api_service.dart';
import '../../../core/typedefs.dart';
import '../models/account.dart';

class AuthRepository {
  final ApiService _apiService;

  const AuthRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  Future<Account> registerUser({
    required JSON data,
    required void Function(String newToken) updateTokenCallback,
  }) async {
    return _apiService.setData<Account>(
        endpoint: ApiEndpoint.auth(AuthEndpoint.REGISTER),
        data: data,
        converter: (response) {
          updateTokenCallback(response.body['token'] as String);
          return Account.fromJson(data);
        });
  }

  Future<Account> loginUser({
    required JSON data,
    required void Function(String newToken) updateTokenCallback,
  }) async {
    return _apiService.setData<Account>(
        endpoint: ApiEndpoint.auth(AuthEndpoint.LOGIN),
        data: data,
        converter: (response) {
          updateTokenCallback(response.body['token'] as String);
          return Account.fromJson(response.body['data']);
        });
  }

  Future<Account> getAccount() async {
    return _apiService.getDocumentData<Account>(
        endpoint: ApiEndpoint.auth(AuthEndpoint.BASE),
        requiresAuthToken: true,
        converter: (response) {
          return Account.fromJson(response['data']);
        });
  }
}
