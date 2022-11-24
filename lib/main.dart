import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/global/colors.dart';
import 'package:organizer_app/src/ui/global/styles.dart';
import 'package:organizer_app/src/ui/pages/task/create_task/create_task.dart';
import 'package:organizer_app/src/ui/pages/task/tasks/tasks.dart';
import 'package:organizer_app/src/ui/pages/user/create_user/create_user.dart';
import 'package:organizer_app/src/ui/pages/user/login/login.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Inter'
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: GlobalColors.kBackgroundColor,
        inputDecorationTheme: GlobalStyles.kInputDecorationTheme,
        fontFamily: 'Inter',
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      onGenerateRoute: (settings) {
        // final args = settings.arguments;
        switch (settings.name) {
          case '/create_user':
            return PageTransition(
              child: const CreateUserPage(),
              type: PageTransitionType.fade,
            );
            case '/login':
            return PageTransition(
              child: const LoginPage(),
              type: PageTransitionType.fade,
            );
            case '/tasks':
            return PageTransition(
              child: const TasksPage(),
              type: PageTransitionType.fade,
            );
             case '/create_task':
            return PageTransition(
              child: const CreateTaskPage(),
              type: PageTransitionType.fade,
            );
          default:
            const LoginPage();
        }
      },
    );
  }
}
