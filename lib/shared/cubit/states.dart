import 'package:shopapp/modules/favourite/changefavouritesModel.dart';
import 'package:shopapp/modules/favourite/favouritesModel.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class ChangeBottomNavState extends AppStates{}


class LoadingHomeDataState extends AppStates{}
class HomeDataSuccessState extends AppStates{}
class HomeDataFailedState extends AppStates{}


class CategorySuccessState extends AppStates{}
class CategoryFailedState extends AppStates{}

class ChangeFavouritesState extends AppStates{}
class ChangeFavouritesSuccessState extends AppStates{
  final ChangeFavouritesModel model;
  ChangeFavouritesSuccessState(this.model);
}
class ChangeFavouritesFailedState extends AppStates{}

class GetFavouritesLoadingState extends AppStates{}
class GetFavouritesSuccessState extends AppStates{}
class GetFavouritesFailedState extends AppStates{}

class GetUserDataLoadingState extends AppStates{}
class GetUserDataSuccessState extends AppStates{}
class GetUserDataFailedState extends AppStates{}