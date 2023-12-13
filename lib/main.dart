import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/services/network/env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.load();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
