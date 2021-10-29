import 'package:flutter/material.dart';
import 'package:shopapp/layout/login_screen.dart';
import 'package:shopapp/network/local/cache_helper.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingItem> boarding = [
    BoardingItem(
        img: 'assets/images/shopApp1.jpg',
        title: 'Explore many products',
        body: 'On Board 1 Body'),
    BoardingItem(
        img: 'assets/images/shopApp1.jpg',
        title: 'Explore many products',
        body: 'On Board 2 Body'),
    BoardingItem(
        img: 'assets/images/shopApp1.jpg',
        title: 'Explore many products',
        body: 'On Board 3 Body'),
  ];

  var boardingController = PageController();

  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: submit,
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      color:Color(0xFF6538A3),
                  fontSize: 16),))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index)
                {
                  setState(() {
                    if(index==boarding.length-1)
                    {
                      isLast=true;
                    }
                    else
                    {
                      isLast=false;
                    }

                  });
                },
                itemBuilder: (context, index) => buildItem(),
                itemCount: boarding.length,
                physics: BouncingScrollPhysics(),
                controller: boardingController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: 250,
              child: buildButton(isLast==true?'Finish':'Next', context),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }

  Widget buildItem() {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('assets/images/shopApp1.jpg'),
          ),
        ),
        Text(
          'Asmaa',
          style: TextStyle(color:Color(0xFF6538A3),fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Asmaa',
          style: TextStyle(fontWeight:FontWeight.w100,fontSize: 16),
        )
      ],
    );
  }
  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).
    then((value) {
      if(value)
        {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context)=>LoginScreen()
              ),
                  (route) => false);
        }
    });

  }

  Widget buildButton(String text,BuildContext context)
  {
    print(text);
    return FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Color(0xFF6538A3),
        child:Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'IBMPlexMono')
        ),
        onPressed: () {
          if(isLast)
          {
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
           submit();
          }
          boardingController.nextPage(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastLinearToSlowEaseIn);
        });
  }
}

class BoardingItem {
  late final String img;
  late final String title;
  late final String body;
  BoardingItem({required this.img, required this.title, required this.body});
}
