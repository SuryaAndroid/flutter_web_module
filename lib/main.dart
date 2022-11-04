import 'package:flutter/material.dart';
import 'package:flutter_web_module/home_pg.dart';
import 'package:flutter_web_module/screen_one.dart';
import 'package:flutter_web_module/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => HomePage(child: child!),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.FIRST_PAGE,
    );
  }
}

class RoutesName {
  // ignore: non_constant_identifier_names
  static const String FIRST_PAGE = '/screen_one';
  // ignore: non_constant_identifier_names
  static const String SECOND_PAGE = '/screen_two';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.FIRST_PAGE:
      //   return _GeneratePageRoute(
      //       widget: ScreenOne(), routeName: settings.name!);
      case RoutesName.SECOND_PAGE:
        return _GeneratePageRoute(
            widget: ScreenTwo(), routeName: settings.name!);
      default:
        return _GeneratePageRoute(
            widget: ScreenTwo(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
      settings: RouteSettings(name: routeName),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return SlideTransition(
          textDirection: TextDirection.rtl,
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });
}

