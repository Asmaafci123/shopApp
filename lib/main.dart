import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/home_screen.dart';
import 'package:shopapp/layout/login_screen.dart';
import 'package:shopapp/network/local/cache_helper.dart';
import 'package:shopapp/shared/cubit/cubit.dart';
import 'package:shopapp/shared/cubit/states.dart';
import 'layout/onbording_screen.dart';
import 'modules/login/cubit/cubit.dart';
import 'network/remote/dio.dart';
import 'styles/themes.dart';
main()async
{
  WidgetsFlutterBinding.ensureInitialized();// ensure that all await is done before runApp
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding=CacheHelper.getData(key: 'onBoarding');
  String? token=CacheHelper.getData(key: 'token');
  Widget startWidget;
  if(onBoarding!=null)
    {
      if(token!=null)
        {
          startWidget=HomeScreen();
        }
      else
        {
          startWidget=LoginScreen();
        }
    }
  else
    {
      startWidget=OnBoardingScreen();
    }
  runApp(MyApp(startWidget: startWidget));
}
class MyApp extends StatelessWidget {
   late final Widget startWidget;
   MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getHomeData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: startWidget,
        )
    );
  }
}
