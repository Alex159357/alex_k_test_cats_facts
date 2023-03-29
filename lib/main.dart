import 'package:alex_k_test_cats_facts/src/config/themes/app_themes.dart';
import 'package:alex_k_test_cats_facts/src/di/injection_container.dart';
import 'package:alex_k_test_cats_facts/src/futures/cat_facts/presentation/pages/cat_facts_home_page.dart';
import 'package:alex_k_test_cats_facts/src/futures/cat_facts/presentation/pages/cats_facts_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CatFactHomePage(),
    );
  }
}
