import 'package:flutter/material.dart';
import 'package:ChatApp/screens/welcome_screen.dart';
import 'package:ChatApp/screens/login_screen.dart';
import 'package:ChatApp/screens/registration_screen.dart';
import 'package:ChatApp/screens/chat_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      //why we not specify routes as hardcoded Strings ?difficult to manage and we declare them as staic to use them without creating object
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
