class HomeModel
{
  bool? status;
  DataModel? data;
  HomeModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data=DataModel.fromJson(Map<String, dynamic>.from(json['data']));
  }
}
class DataModel
{
  List<BannerModel>banners=[];
  List<ProductModel>products=[];
  DataModel.fromJson(Map<String,dynamic>json)
  {
    json['banners'].forEach((element)
        {
          banners.add(BannerModel.fromJson(element));
        }
    );
    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJson(element));
    }
    );
  }
}
class BannerModel
{
  int? id;
  String?image;
  BannerModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    image=json['image'];
  }
}
class ProductModel
{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavourite;
  late bool inCart;
  ProductModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavourite=json['in_favorites'];
    inCart=json['in_cart'];

  }
}