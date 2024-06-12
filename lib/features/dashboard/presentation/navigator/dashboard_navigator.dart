

import 'package:clean_architecture/app/navigator/navigator.dart';
import 'package:clean_architecture/features/batch/presentation/navigator/batch_navigator.dart';
import 'package:clean_architecture/features/batch/presentation/view/batch_view.dart';


class DashboardViewNavigator with BatchViewRoute {
  @override
  void openBatchView(){
   NavigateRoute.popAndPushRoute(const BatchView());
  }

}

mixin DashboardViewRoute{
  void openDashboardView(){

  }



}