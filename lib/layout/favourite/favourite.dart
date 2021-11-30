
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/modules/favourite/favouritesModel.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/cubit/cubit.dart';
import 'package:shopapp/shared/cubit/states.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return ListView.separated(

            itemBuilder:(context,index)=>buildProductList(AppCubit.get(context).favoritesModel!.data!.data![index],context),
            separatorBuilder: (context,index)=>SizedBox(height: 5,),
            itemCount:AppCubit.get(context).favoritesModel!.data!.data!.length);
      },
    );
  }

}
