import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:manga_reader_app/firebase_options.dart";
import "package:manga_reader_app/modals/recent_book_modal.dart";
import "package:manga_reader_app/pages/home_page.dart";
import "package:manga_reader_app/services/auth_services.dart";
import "package:provider/provider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AuthServices authService = AuthServices();
  await authService.login("test@gmail.com", "password");

  runApp(ChangeNotifierProvider(
      create: (context) => RecentBookModal(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
