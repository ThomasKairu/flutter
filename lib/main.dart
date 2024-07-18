import 'package:angel_fetus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zhqtfcysugvvnkderogi.supabase.co',
    anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpocXRmY3lzdWd2dm5rZGVyb2dpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUwOTM5ODEsImV4cCI6MjAzMDY2OTk4MX0.RPz0BEAyFoHArvbRb6wsye2qY1MF2dJ4ZY7zD0kMtSI',
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angel Fetus',
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}