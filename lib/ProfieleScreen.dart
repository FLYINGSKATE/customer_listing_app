import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {

  final DocumentSnapshot profileData;

  const ProfileScreen({Key? key, required this.profileData}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;


    String startDate = DateFormat('dd/MM/yyyy').format((widget.profileData["start_date"]).toDate());
    String endDate = DateFormat('dd/MM/yyyy').format((widget.profileData["end_date"]).toDate());

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Customer Details',
          style: Theme.of(context).textTheme.headline1?.copyWith(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.calendar_month,color: Theme.of(context).primaryColor,size: 30,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Date",style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),),
                      Text(startDate,style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w200,
                      ),)
                    ],
                  ),
                  SizedBox(width: 10,),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20),
                    child: VerticalDivider(color:Theme.of(context).primaryColor ,thickness: 2,),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.calendar_month,color: Theme.of(context).primaryColor,size: 30,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("End Date",style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),),
                      Text(endDate,style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w200,
                      ),)
                    ],
                  )
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              height: height*0.1,
              /*decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20),))*/
            ),
            Divider(color:Theme.of(context).primaryColor ,thickness: 2,),
            Container(
              height: height*0.71,
              child: ListView(
                children: [
                  SizedBox(height: height*0.02,),
                  Text("Case Id",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["case_id"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("Customer Name",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["customer_name"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("Address",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["address"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("Area",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["area"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("EGG Name",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["egg_name"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("Mobile Number",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["mobile_number"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("Remark",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["remark"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("Unit",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["unit"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),

                  SizedBox(height: height*0.02,),
                  Text("WS",style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                  Text(widget.profileData["w_s"],style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),),
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
