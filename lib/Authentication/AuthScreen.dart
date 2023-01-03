import 'package:customer_listing_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'SignInScreen.dart';
import 'SignUpScreen.dart';
import 'package:timezone/timezone.dart' as tz;
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  ImageProvider splashScreenLogo = AssetImage("assets/subscribo.png");



  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor:Theme.of(context).primaryColor,
          body: Column(
            children: <Widget>[
              // construct the profile details widget here
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.13,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: splashScreenLogo,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subscribo!",style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: Colors.white,
                          fontSize: 26,
                        ),),
                        Text("Customer Listing & Management",style:Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),),
                      ],
                    )

                  ],
                ),
              ),
              // the tab bar with two items
              Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  height: 100,
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                    bottom: TabBar(
                      indicatorColor: Colors.white,
                      labelStyle:Theme.of(context).textTheme.headline1?.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      tabs: [
                        Tab(
                          text: "Sign In",

                        ),
                        Tab(
                          text: "Sign Up",
                        ),
                      ],
                    ),
                  ),
                ),),
              // create widgets for each tab bar here
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    SignInScreen(),

                    // second tab bar viiew widget
                    SignUpScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}










