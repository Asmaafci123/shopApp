import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/categury/catougry.dart';
import 'package:shopapp/layout/favourite/favourite.dart';
import 'package:shopapp/layout/home_screen.dart';
import 'package:shopapp/layout/products/products_screen.dart';
import 'package:shopapp/layout/settings/SettingScreen.dart';
import 'package:shopapp/modules/Home/homeModel.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/remote/dio.dart';
import 'package:shopapp/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>bottomScreen=[
    HomeScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];
  void changeNavBottom(int index)
  {
    currentIndex=index;
    emit(ChangeBottomNavState());
  }
  late HomeModel homeModel;
  void getHomeData()
  {
    emit(LoadingHomeDataState());
    DioHelper.getData(
        url: HOME).
    then((value) {
      homeModel=HomeModel.fromJson(Map<String, dynamic>.from(value.data));
      print(homeModel.data);
      emit(HomeDataSuccessState());
    }).
    catchError((error)
    {
      emit(HomeDataFailedState());
    });
  }
}