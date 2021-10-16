class LoginModel
{
  late bool status;
  late String message;
  UserData? data;// may given null
  LoginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data']?UserData.fromJson(json['data']):null;
  }
}

class UserData
{
 late int id;
 late String name;
 late String email;
 late String image;
 late int points;
 late int credits;
 late String token;
 UserData.fromJson(Map<String,dynamic> json)
 {
   id=json['id'];
   name=json['name'];
   email=json['email'];
   image=json['image'];
   points=json['points'];
   credits=json['credits'];
   token=json['token'];
 }
}