import 'package:app/src/screens/anotations_screen.dart';
import 'package:app/src/screens/home_screen.dart';
import 'package:app/src/screens/login_screen.dart';
import 'package:app/src/screens/register_screen.dart';
import 'package:app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigationApp = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0XFFE99A01),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Color(0XFFE99A01)),
          iconTheme: IconThemeData(color: Color(0XFFE99A01))),
      navigatorKey: navigationApp,
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
