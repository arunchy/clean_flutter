import 'package:clean_architecture/app/navigator/navigator.dart';
import 'package:clean_architecture/features/auth/presentation/navigator/register_navigator.dart';
import 'package:clean_architecture/features/auth/presentation/view/login_view.dart';
import 'package:clean_architecture/features/auth/presentation/view/register_view.dart';
import 'package:clean_architecture/features/batch/presentation/navigator/batch_navigator.dart';
import 'package:clean_architecture/features/batch/presentation/view/batch_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final loginViewNavigatorProvider=Provider((ref)=>LoginViewNavigator());
class LoginViewNavigator with BatchViewRoute,RegisterViewRoute{
@override
  void openBatchView(){
  NavigateRoute.popAndPushRoute(const BatchView());
}
@override
  void openRegisterView(){
  NavigateRoute.popAndPushRoute(const RegisterView());
}
}

mixin LoginViewRoute{
  openLoginView(){

  }

}