import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/modules/favourite/favouritesModel.dart';
import 'package:shopapp/shared/cubit/cubit.dart';

void showFlutterToast(
{
  required String msg,
  required toastStates toasts
}
    )=>Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: buildToastColor(toasts),
    textColor: Colors.white,
    fontSize: 16.0
);
enum toastStates{success,error,warning}
Color buildToastColor(toastStates toasts)
{
  switch(toasts)
  {
    case toastStates.success:
      return Colors.green;
      break;
    case toastStates.error:
      return Colors.red;
      break;
    case toastStates.warning:
      return Colors.amber;
      break;
  }
}
Widget buildProductList(model,BuildContext context)
{
  return  Container(
    height: 180,
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        Container(
          height: 100,
          child: Row(
            children:
            [
              Image(image: NetworkImage('${model!.product!.image!}'),width: 100,height: 100,),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text('${model!.product!.name}',
                      style: const TextStyle(fontSize: 15,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    const Spacer(),
                    Text('EGP ${model!.product!.price!}',style: const TextStyle(color:Color(0xFF9400D2),fontSize: 20,fontWeight: FontWeight.bold),),
                    if(model!.product!.discount != 0)
                      Text('EGP ${model!.product!.oldPrice!}',style: const TextStyle(color:Color(0xFF9400D2),decoration: TextDecoration.lineThrough),),
                  ],
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Row(
          children:
          [
            const Spacer(),
            const Icon(Icons.delete_outline_outlined,color:Color(0xFF9400D2),),
            TextButton(
                onPressed: ()
                {
                  AppCubit.get(context).changeFavourites(model!.product!.id!);
                },
                child: const Text('Remove',style: TextStyle(color:Color(0xFF9400D2),))
            ),
          ],
        )
      ],
    ),

  );
}