import 'package:clean_architecture/app/navigator/navigator.dart';
import 'package:clean_architecture/features/dashboard/presentation/navigator/dashboard_navigator.dart';
import 'package:clean_architecture/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:riverpod/riverpod.dart';
final batchViewNavigatorProvider=Provider((ref)=>BatchViewNavigator());
class BatchViewNavigator with DashboardViewRoute{
 @override
  void openDashboardView() {
     NavigateRoute.popAndPushRoute(const DashboardView());
  }
}
mixin BatchViewRoute{
  openBatchView(){

  }
}