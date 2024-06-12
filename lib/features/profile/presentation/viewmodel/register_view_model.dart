import 'package:clean_architecture/features/auth/presentation/navigator/register_navigator.dart';
import 'package:riverpod/riverpod.dart';


final registerViewModelProvider=StateNotifierProvider<RegisterViewModel,void>((ref){
     final navigator=ref.read(registerViewNavigatorProvider);
     return RegisterViewModel(navigator);
});


class RegisterViewModel extends StateNotifier<void>{
  RegisterViewModel(this.navigator) :super(null);
  final RegisterNavigator navigator;
  void openLoginView(){
    navigator.openLoginView();
  }

}