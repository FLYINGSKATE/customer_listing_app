import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class Utility{

  void PleaseWaitLoaderShow(BuildContext context) {
    Loader.show(context,
        isSafeAreaOverlay: false,
        isBottomBarOverlay: false,
        overlayFromBottom: 80,
        overlayColor: Colors.black54,
        progressIndicator: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 90.0,
              height: 90.0,
              child:CircularProgressIndicator(
                  strokeWidth: 10.0,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10,),
            Text("Please Wait",
                style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                )
            ),
          ],)),
        themeData: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
    );
  }

  void showCustomDialogBox(bool isSuccess, title, description, BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Material(
              child: Container(
                height: 250,
                child: Column(
                  children: [
                    Container(height: 50,
                        margin: const EdgeInsets.only(bottom:20.0),
                        width: MediaQuery.of(context).size.width,
                        color: isSuccess?Theme.of(context).primaryColor:Colors.redAccent, child: Center(
                          child: Text(title,
                            style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 22,
                            ),),
                        )),

                    isSuccess?Icon(Icons.check_circle,color: Colors.green,size: 100,):Icon(Icons.error,color: Colors.redAccent,size: 100,),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Text(description),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }
}