import 'package:clean_architecture/app/navigator/navigator.dart';
import 'package:clean_architecture/features/auth/presentation/navigator/login_navigator.dart';
import 'package:clean_architecture/features/auth/presentation/view/login_view.dart';
import 'package:riverpod/riverpod.dart';

final registerViewNavigatorProvider=Provider((ref)=>RegisterNavigator());
class RegisterNavigator with LoginViewRoute{
   @override
  void openLoginView(){
    NavigateRoute.popAndPushRoute(const LoginView());
   }
}
mixin RegisterViewRoute{
  openRegisterView(){

  }
}