import 'dart:async';
import 'dart:convert';

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget  {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.


  ImageProvider splashScreenLogo = AssetImage("assets/subscribo.png");

  _SupportState _supportState = _SupportState.unknown;







  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => navigateToProperScreen());



  }


  @override
  Widget build(BuildContext context) {
    precacheImage(splashScreenLogo, context);
    return Material(
        color: Theme.of(context).backgroundColor,
        child:Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
        ),
        child:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.24,),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*0.42,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: splashScreenLogo,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'Subscribo!',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Text(
                'Customer Management & Listing',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.28,),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Text(
                'Developed by 3CosInnovative Pvt Ltd.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: 'Lexend Deca',
                  color: Color(0x98FFFFFF),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ))
    ));
  }





  Future<void> navigateToProperScreen() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    // Save an integer value to 'counter' key.
    // print(await prefs.getString('haveRegistered'));
    String? mailId = await prefs.getString('mail_id');

    print("I have Registered");
    if(mailId==null){
      Navigator.pushReplacementNamed(context,'AuthScreen');
    }
    else{
      Navigator.pushReplacementNamed(context,'HomeScreen');
    }
  }


}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
