import 'package:clean_architecture/features/batch/presentation/view/batch_view.dart';
import 'package:clean_architecture/features/course/presentation/view/course_view.dart';
import 'package:clean_architecture/features/dashboard/presentation/view/dashboard_screen.dart';
import 'package:clean_architecture/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const DashboardScreen(),
    const CourseView(),
    const BatchView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Dashboard View'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.replay,
      //         color: Colors.white,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.exit_to_app,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // it will fix the issue if we add 4 items
        backgroundColor: Colors.greenAccent,
        items: const [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(label: 'Course', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'Batch', icon: Icon(Icons.light)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_2)),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
