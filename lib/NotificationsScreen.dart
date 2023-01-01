import 'package:flutter/material.dart';

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

      body: ListView.builder(
          itemCount: 200,
          itemBuilder: (c,i){
        return ListTile(
          title: Text(
            'AbdulKarim\'s',
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
      }),
    );
  }
}
