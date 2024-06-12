import 'package:clean_architecture/app/app.dart';
import 'package:clean_architecture/core/networking/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(ProviderScope(child: const App()));
}
