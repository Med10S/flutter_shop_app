import 'package:flutter_shop_app_dbestech/pages/register/provider/register_state.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterStateNotifier extends _$RegisterStateNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUserNameChange(String name) {
    state = state.copyWith(userName: name);
  }

  onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  onUserRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }
}
