import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/search/search_cubit.dart';
import 'package:shopapp/layout/search/search_states.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/cubit/cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:BlocProvider(
        create: (BuildContext context)=>SearchCubit(),
        child:  BlocConsumer<SearchCubit,SearchStates>(
          listener: (context,state){},
          builder: (context,state)
          {
            var searchController=TextEditingController();
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          color: Colors.grey
                        ),
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search...',
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      controller: searchController,
                      onSubmitted: (String text)
                      {
                        SearchCubit.get(context).search(text);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if(state is SearchLoadingState)
                    CircularProgressIndicator(),
                  // Expanded(
                  //   child: ListView.separated(
                  //
                  //       itemBuilder:(context,index)=>buildProductList(SearchCubit.get(context).model!.data!.data![index],context),
                  //       separatorBuilder: (context,index)=>SizedBox(height: 5,),
                  //       itemCount:SearchCubit.get(context).model!.data!.data!.length),
                  // )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
