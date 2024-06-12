import 'package:clean_architecture/app/navigator/navigator.dart';
import 'package:clean_architecture/features/auth/presentation/view/login_view.dart';
import 'package:clean_architecture/features/batch/presentation/navigator/batch_navigator.dart';
import 'package:clean_architecture/features/batch/presentation/view/batch_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/navigator/login_navigator.dart';


final splashViewNavigatorProvider=Provider((ref)=>SplashViewNavigator());

class SplashViewNavigator with LoginViewRoute,BatchViewRoute{
  @override
void openLoginView(){
  NavigateRoute.pushRoute(const LoginView());
}
@override
void openBatchView(){
  NavigateRoute.pushRoute(const BatchView());
}

}  //open from splash screen






mixin SplashViewRoute{
  openSplashView(){
    NavigateRoute.pushRoute(const LoginView());
  }
}   //used for opening splash screen
