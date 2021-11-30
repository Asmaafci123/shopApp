import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/modules/login/login_model.dart';
import 'package:shopapp/shared/cubit/cubit.dart';
import 'package:shopapp/shared/cubit/states.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var model=AppCubit.get(context).loginModel;
    var items=['English','Arabic'];
    String dropDownValue=items[0];
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
       //   mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFF9400D2),
                          child: Center(child: Icon(Icons.person_rounded,color: Colors.white,size: 70,)),
                          radius: 40,
                        ),
                        SizedBox(height: 20,),
                        Text(
                            model!.data!.name!,style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          model!.data!.phone!,style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          model!.data!.email!,style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 0.2,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preferences',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF9400D2)
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.language,color: Colors.grey,),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Language',style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),),
                            Spacer(),
                            DropdownButton(
                              underline: SizedBox(),
                              icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                size: 17,
                              ),
                                items: items.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                      child: Text(item));
                                }).toList(),
                              onChanged: (String? newValue){
                                  setState(() {
                                    dropDownValue=newValue!;
                                  });
                              },
                              //value: dropDownValue,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.dark_mode,color: Colors.grey,),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Dark Mode',style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),),
                            Spacer(),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        );
      },
    );
  }
}
