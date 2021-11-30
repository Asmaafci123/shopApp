
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/search/search_screen.dart';
import 'package:shopapp/shared/cubit/cubit.dart';
import 'package:shopapp/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>SearchScreen()));
                    }, icon: Icon(Icons.search))
              ],
            ),
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon:Icon(Icons.home,),
                    label: '',
                activeIcon: Icon(Icons.home,color: Color(0xFF9400D2),)),
                BottomNavigationBarItem(icon:Icon(Icons.category),label: '',activeIcon: Icon(Icons.category,color: Color(0xFF9400D2),)),
                BottomNavigationBarItem(icon:Icon(Icons.favorite),label: '',activeIcon: Icon(Icons.favorite,color: Color(0xFF9400D2),)),
          //      BottomNavigationBarItem(icon:Icon(Icons.settings),label: '',activeIcon: Icon(Icons.settings,color: Color(0xFF9400D2),))
              ],
              onTap: (index)
              {
                cubit.changeNavBottom(index);
              },
            ),
          );
        },
       );
  }
}
