
import 'package:riverpod/riverpod.dart';

import '../navigator/login_navigator.dart';

final loginViewModelProvider=StateNotifierProvider<LoginViewModel,void>((ref){
  final navigator=ref.read(loginViewNavigatorProvider);
  return LoginViewModel(navigator);
});



class LoginViewModel extends StateNotifier<void>{
  LoginViewModel(this.navigator) : super(null);
  final LoginViewNavigator navigator;
  void openRegisterView(){
    navigator.openRegisterView();
  }

  void openDashboardView(){
    navigator.openDashboardView();
  }

}