import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loxtest/services/message_dao.dart';
import 'package:loxtest/services/user_dao.dart';
import 'package:loxtest/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
// import 'package:loxtest/screens/home.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<MessageDao>(
          lazy: false,
          create: (_) => MessageDao(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
