import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_listing_app/utils/ApiRepository.dart';
import 'package:flutter/material.dart';

import 'ProfieleScreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headline1?.copyWith(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),

      body:FutureBuilder(
        builder: (ctx, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: TextStyle(fontSize: 18),
                ),
              );

              // if we got our data
            } else if (snapshot.hasData) {
              // Extracting data from snapshot object
              final data = snapshot.data as List<DocumentSnapshot>?;

              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (c,i){
                    return ListTile(

                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen(profileData: data[i])),
                        );
                      },

                      title: Text(
                        data[i]["customer_name"]+"\'s",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        'Membership has Expired ',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    );
                  });
            }
          }

          // Displaying LoadingSpinner to indicate waiting state
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              SizedBox(
                width: 90.0,
                height: 90.0,
                child:CircularProgressIndicator(
                    strokeWidth: 10.0,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 20,),
              Text("Please Wait",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  )
              ),
            ],));
        },

        // Future that needs to be resolved
        // inorder to display something on the Canvas
        future: ApiRepository().FetchListOfNotifications(),
      ),


    );
  }
}
