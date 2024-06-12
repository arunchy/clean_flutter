import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _sliderValueNotifier =
    ValueNotifier<double>(50);
    return SizedBox.expand(
      child: Column(
        children: [
          AppBar(
            title: const Text('Dashboard View'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
                activeColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
