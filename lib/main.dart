import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../view/splash_screen.dart';
import '../view/login_screen.dart';
import '../view/main_screen.dart';
import '../service/auth_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase dengan options
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)), // Delay untuk splash
        builder: (context, snapshot) {
          // Periksa status login
          final authService = Provider.of<AuthService>(context, listen: false);
          if (authService.isLoggedIn) {
            return const MainScreen();
          } else {
            return const SplashScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}