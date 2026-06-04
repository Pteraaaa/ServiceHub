import '../models/user_models.dart';

class AuthService {
  Future<void> register({
    required UserModel user,
    required String password,
  }) async {
    // Firebase Auth

    // Backend API Call

    print(user.toJson());
  }
}
