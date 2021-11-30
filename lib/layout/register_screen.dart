import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFF6538A3),
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                elevation: 5,
                child: Container(
                  height: 500,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SIGN IN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'normal'),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'normal',
                                      fontWeight: FontWeight.normal),
                                  hintText: 'User name/Email',
                                  prefixIcon: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fillColor: Color(0xFF9400D2),
                                  filled: true),
                              onChanged: (String value) {
                                if (value.isEmpty) return;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                // LoginCubit.get(context).userLogin(
                                //     email: emailController.text,
                                //     password: passwordController.text);
                              },
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'normal',
                                      fontWeight: FontWeight.normal),
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.white,
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fillColor: Color(0xFF9400D2),
                                  filled: true),
                              onChanged: (String value) {
                                if (value.isEmpty) return;
                              },
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot password ?',
                                      style: TextStyle(
                                          color: Colors.grey[800]),
                                    )),
                              ],
                            ),
                            Container(
                              width: 100,
                              child: FloatingActionButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  backgroundColor: Color(0xFF9400D2),
                                  child: Text('LOGIN',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'IBMPlexMono')),
                                  onPressed: () {
                                    // LoginCubit.get(context).userLogin(
                                    //     email: emailController.text,
                                    //     password: passwordController.text);
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have account ?'),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Color(0xFF9400D2),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ))
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
