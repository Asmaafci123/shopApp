import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopapp/modules/Category/category_model.dart';
import 'package:shopapp/modules/Home/homeModel.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/cubit/cubit.dart';
import 'package:shopapp/shared/cubit/states.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context,state){
          if(AppCubit.get(context).homeModel!=null && AppCubit.get(context).categoriesModel!=null)
            {
              return productBuilder(AppCubit.get(context).homeModel!,AppCubit.get(context).categoriesModel!,context);
            }
          else
            {

              return Center(child:CircularProgressIndicator());
            }
        },
        listener: (context,state){
          if(state is ChangeFavouritesSuccessState)
            {
              if(!state.model.status!)
                {
                  showFlutterToast(msg:state.model.message!,toasts: toastStates.error);
                }
            }
        });
  }
}
Widget productBuilder(HomeModel model,CategoriesModel categoriesModel,BuildContext context)
{
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
              items: model.data?.banners.map((e) => Image(
                image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
              )).toList(),
              options:  CarouselOptions(
                height: 150,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )
          ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Categories',
                style: TextStyle(
                    fontWeight: FontWeight.w800,fontSize: 20,
                color: Color(0xFF6538A3)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>buildCategory(categoriesModel.data!.data[index]),
                    separatorBuilder: (context,index)=>SizedBox(width: 10,),
                    itemCount: categoriesModel.data!.data.length),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'New Products',
                style: TextStyle(
                    fontWeight: FontWeight.w800,fontSize: 20,
                    color: Color(0xFF6538A3)),
              ),
            ],
          ),
        ),

        Container(
          child: GridView.count(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1/1.7,
              crossAxisCount: 2,
            children: List.generate(
                model.data!.products.length,
                    (index) => buildGridProduct(model.data!.products[index],context))
          ),
        ),

      ],
    ),
  );
}
Widget buildGridProduct(ProductModel model,BuildContext context)
{
bool change=false;
return Container(
  color: Colors.white,
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(model.discount!=0)
                Container(
                    height: 50,
                    width: 50,
                    child: Image(image: AssetImage('assets/images/discount.jpg'),)),
              Spacer(),
              IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeFavourites(model.id);

                  },
                  icon:AppCubit.get(context).favourites[model.id]! ? Icon(
                    Icons.favorite,
                    size: 30,
                    color: Color(0xFF9400D2)
                  ):Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.grey,
                  )
                  )
            ],
          ),
          Image(

              image: NetworkImage('${model.image}'),

            height: 200,

            width: double.infinity,

          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${model.name}',

              maxLines: 2,

              overflow: TextOverflow.ellipsis,),

            Row(

              children: [

                Text(

                  '${model.price.round()}',

                  style: TextStyle(color: Color(0xFF6538A3)),),

                SizedBox(

                  width: 5,

                ),
                if(model.discount!=0)
                Text(

                  '${model.oldPrice.round()}',

                  style: TextStyle(

                      color: Colors.grey[600],

                    decoration: TextDecoration.lineThrough

                  ),

                ),

              ],

            ),
          ],
        ),
      ),
    ],

  ),
);
}
Widget buildCategory(CatDataModel model)
{
  return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          height: 100,
          width: 100,
        ),
        Container(
          width: 100,
          color: Colors.white.withOpacity(0.8),
          child: Text(
            '${model.name}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color:Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        )
      ],
    );
}