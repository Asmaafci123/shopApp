import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/categury/catougry.dart';
import 'package:shopapp/layout/favourite/favourite.dart';
import 'package:shopapp/layout/products/products_screen.dart';
import 'package:shopapp/layout/settings/SettingScreen.dart';
import 'package:shopapp/modules/Category/category_model.dart';
import 'package:shopapp/modules/Home/homeModel.dart';
import 'package:shopapp/modules/favourite/changefavouritesModel.dart';
import 'package:shopapp/modules/favourite/favouritesModel.dart';
import 'package:shopapp/modules/login/login_model.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/remote/dio.dart';
import 'package:shopapp/shared/components/constents.dart';
import 'package:shopapp/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget>bottomScreen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];

  void changeNavBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
  HomeModel? homeModel;
  Map<int,bool>favourites={};
  void getHomeData() async {
    await DioHelper.getData(
        url: HOME,
        token: token
    ).
    then((value) {
      homeModel = HomeModel.fromJson(Map<String, dynamic>.from(value.data));
      homeModel?.data?.products.forEach((element) {
        favourites.addAll({
          element.id:element.inFavourite
        });
      });
      print(favourites.toString());
      emit(HomeDataSuccessState());
    }).
    catchError((error) {
      print(error.toString());
      emit(HomeDataFailedState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData()async  {
    await DioHelper.getData(
      url: GET_CATEGORIES,
    ).
    then((value) {
      categoriesModel =
          CategoriesModel.fromJson(Map<String, dynamic>.from(value.data));
      emit(CategorySuccessState());
    }).
    catchError((error) {
      print(error.toString());
      emit(CategoryFailedState());
    });
  }


  ChangeFavouritesModel? changeFavouritesModel;
  void changeFavourites(int id)async
  {
    favourites[id]=!favourites[id]!;
    emit(ChangeFavouritesState());
    await DioHelper.postData(
        url: FAVOURITES,
        data: {
          'product_id':id
        },
      token: token
    ).
    then((value) {
      changeFavouritesModel=ChangeFavouritesModel.fromJson(Map<String, dynamic>.from(value.data));
      if(changeFavouritesModel!.status==false)
        {
          favourites[id]=!favourites[id]!;
        }
      else
        {
          getFavouritesData();
        }
      emit(ChangeFavouritesSuccessState(changeFavouritesModel!));
    }).
    catchError((error){
      favourites[id]=!favourites[id]!;
      emit(ChangeFavouritesFailedState());
    });
  }


  FavoritesModel? favoritesModel;
  void getFavouritesData()async  {
    emit(GetFavouritesLoadingState());
    await DioHelper.getData(
        url: FAVOURITES,
        token: token
    ).
    then((value) {
      favoritesModel =
          FavoritesModel.fromJson(Map<String, dynamic>.from(value.data));
      print(favoritesModel!.status);
      emit(GetFavouritesSuccessState());
    }).
    catchError((error) {
      print(error.toString());
      emit(GetFavouritesFailedState());
    });
  }

  LoginModel? loginModel;
  void getUserData()async  {
    emit(GetFavouritesLoadingState());
    await DioHelper.getData(
        url: PROFILE,
        token: token
    ).
    then((value) {
      loginModel =
          LoginModel.fromJson(Map<String, dynamic>.from(value.data));
      print(loginModel!.data!.id);
      emit(GetUserDataSuccessState());
    }).
    catchError((error) {
      print(error.toString());
      emit(GetUserDataFailedState());
    });
  }
}
