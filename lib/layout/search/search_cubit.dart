import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/search/search_states.dart';
import 'package:shopapp/modules/search/search_model.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/remote/dio.dart';
import 'package:shopapp/shared/components/constents.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);

  SearchModel? model;

  void search(String txt)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token:token,
        data: {'text':txt},
    ).
    then((value){
      model=SearchModel.fromJson(Map<String, dynamic>.from(value.data));
      emit(SearchSuccessState());
      print(model!.data!.currentPage);
    }).catchError((error){
      print(error.toString());
      emit(SearchIFailedState());
    });
  }
}