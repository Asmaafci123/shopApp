import 'package:flutter/material.dart';
import 'layout/onbording_screen.dart';
import 'network/remote/dio.dart';
import 'styles/themes.dart';
main()
{
 // WidgetsFlutterBinding.ensureInitialized();// ensure that all await is done before runApp
  DioHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: OnBoardingScreen(),
    );
  }
}
