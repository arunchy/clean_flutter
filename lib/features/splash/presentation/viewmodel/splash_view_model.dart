import 'package:clean_architecture/features/splash/presentation/navigator/splash_navigator.dart';
import 'package:clean_architecture/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewModelProvider=StateNotifierProvider<SplashViewModel,void>((ref){
  final navigator=ref.read(splashViewNavigatorProvider);
  return SplashViewModel(navigator);
});
class SplashViewModel extends StateNotifier<void>{
  SplashViewModel(this.navigator) :super(null);
  final SplashViewNavigator navigator;
  void openLoginView(){
  Future.delayed(const Duration(seconds: 2),(){
     navigator.openLoginView();
  });
  void openBatchView(){
    Future.delayed(const Duration(seconds: 2),(){
      navigator.openBatchView();
    });
  }
  }
}