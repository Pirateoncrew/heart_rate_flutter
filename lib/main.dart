import 'package:heartRate/providers/circulat_animation_provider.dart';
import 'package:heartRate/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomePage(),
};
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CircularAnimationProvider>.value(
          value: CircularAnimationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'HeartRate',
        theme: ThemeData(
          canvasColor: Color.fromRGBO(238, 238, 238, 1),
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          // fontFamily: 'Quicksand',
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
                button: TextStyle(color: Colors.white24)),
          ),
        ),
        home: SplashScreen(),
        routes: routes,
      ),
    );
  }
}
