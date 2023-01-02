import 'package:customer_listing_app/utils/ApiRepository.dart';
import 'package:customer_listing_app/utils/utility.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification_scheduler/firebase_notification_scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  TextEditingController? startDateController;
  TextEditingController? caseIdController;
  TextEditingController? endDateController;
  TextEditingController? customerNameController;
  TextEditingController? customerMobileNumberController;
  TextEditingController? areaController;
  TextEditingController? wsController;
  TextEditingController? unitController;
  TextEditingController? eggController;
  TextEditingController? remarkController;
  TextEditingController? customerAddressController;


  String? startDateErrorText;
  String? endDateErrorText;
  String? customerNameErrorText;
  String? caseIdErrorText;
  String? areaErrorText;
  String? customerMobileNumberErrorText;
  String? wsErrorText;
  String? remarkErrorText;
  String? eggErrorText;
  String? unitErrorText;
  String? customerAddressErrorText;

  DateTime? endDateTime ;
  DateTime? startDateTime ;


  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseNotificationScheduler firebaseNotificationScheduler =
  FirebaseNotificationScheduler(authenticationKey: 'MjdhYWYyOTItZDdmMi00NjJmLThmMjMtMzlkZGRkMzMzZWYzOlhFczZrc3JSOGhaUng3VXZkRk51Qy9SOHY4NGM0Rks=', rapidApiKey: '');

  late Future<List<ScheduledNotification>> getScheduledNotificationFuture;

  @override
  void initState() {
    super.initState();
    startDateController = TextEditingController();
    caseIdController = TextEditingController();
    endDateController = TextEditingController();
    customerNameController = TextEditingController();
    customerMobileNumberController = TextEditingController();
    areaController = TextEditingController();
    wsController = TextEditingController();
    unitController = TextEditingController();
    eggController = TextEditingController();
    remarkController = TextEditingController();
    customerAddressController = TextEditingController();
  }

  @override
  void dispose() {
    startDateController?.dispose();
    caseIdController?.dispose();
    endDateController?.dispose();
    customerNameController?.dispose();
    customerMobileNumberController?.dispose();
    areaController?.dispose();
    wsController?.dispose();
    unitController?.dispose();
    eggController?.dispose();
    remarkController?.dispose();
    customerAddressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Customer',
          style: Theme.of(context).textTheme.headline1?.copyWith(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Text("Please Fill Proper Customer Details in the below given Form",
                      style: TextStyle(color: Colors.grey,fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 16),
                    child: TextFormField(
                      controller: caseIdController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Case Id',
                        errorText: caseIdErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: startDateController,
                      obscureText: false,
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData().copyWith(
                                primaryColor: Theme.of(context).primaryColor,
                                colorScheme: ColorScheme.light(primary: Theme.of(context).primaryColor),
                                buttonTheme: ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if(pickedDate != null ){
                          print(pickedDate);
                          startDateTime = pickedDate;//pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            startDateController?.text = formattedDate; //set output date to TextField value.
                          });
                        }else{
                          print("Date is not selected");
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        errorText: startDateErrorText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: null,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: endDateController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        errorText: endDateErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: null,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData().copyWith(
                                  primaryColor: Theme.of(context).primaryColor,
                                  colorScheme: ColorScheme.light(primary: Theme.of(context).primaryColor),
                                  buttonTheme: ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary
                                  ),
                                ),
                                child: child!,
                              );
                            },
                        );

                        if(pickedDate != null ){
                          print(pickedDate);
                          endDateTime = pickedDate;//pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            endDateController?.text = formattedDate; //set output date to TextField value.
                          });
                        }else{
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: customerNameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Customer Name',
                        errorText: customerNameErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: customerMobileNumberController,
                      obscureText: false,
                      decoration: InputDecoration(
                        errorText: customerMobileNumberErrorText,
                        labelText: 'Customer Mobile Number',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: areaController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Area',
                        errorText: areaErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: wsController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'WS',
                        errorText: wsErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: unitController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Unit',
                        errorText: unitErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: eggController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'EGG  Name',
                        errorText: eggErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                    child: TextFormField(
                      controller: remarkController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintText: 'Remark',
                        errorText: remarkErrorText,
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                    child: TextFormField(
                      controller: customerAddressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        errorText: customerAddressErrorText,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        hintText: 'Customer Address',
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).dialogBackgroundColor,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 24, 60, 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Theme.of(context).backgroundColor,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            ),
                        onPressed: () async {




                          startDateErrorText = startDateController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          endDateErrorText = endDateController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          customerNameErrorText = customerNameController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          caseIdErrorText = caseIdController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          areaErrorText = areaController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          customerMobileNumberErrorText = customerMobileNumberController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          wsErrorText = wsController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          remarkErrorText = remarkController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          eggErrorText = eggController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          unitErrorText = unitController!.text.isNotEmpty?null:"Field Cannot be Blank";
                          customerAddressErrorText = customerAddressController!.text.isNotEmpty?null:"Field Cannot be Blank";


                          if(
                          startDateController!.text.isNotEmpty &&
                          caseIdController!.text.isNotEmpty &&
                          endDateController!.text.isNotEmpty &&
                          customerNameController!.text.isNotEmpty &&
                          customerMobileNumberController!.text.isNotEmpty &&
                          areaController!.text.isNotEmpty &&
                          wsController!.text.isNotEmpty &&
                          unitController!.text.isNotEmpty &&
                          eggController!.text.isNotEmpty &&
                          remarkController!.text.isNotEmpty &&
                          customerAddressController!.text.isNotEmpty
                          ){
                            Utility().PleaseWaitLoaderShow(context);
                            bool isCustomerAddedSuccessfully = await ApiRepository().AddCustomer(
                              customerAddressController!.text,
                              areaController!.text,
                              caseIdController!.text,
                              eggController!.text,
                              endDateTime!,
                              startDateTime!,
                              customerNameController!.text,
                              remarkController!.text,
                              unitController!.text,
                              wsController!.text,
                              customerMobileNumberController!.text,
                            );
                            //Loader.hide();
                            if(isCustomerAddedSuccessfully){
                              print("Added Customer Successfully");
                              scheduleAPushNotification(customerNameController!.text.toString(),endDateTime!);
                            }
                            else{
                              print("Some Error");
                            }

                          }




                          setState(() {

                          });
                          
                          
                          print('Button pressed ...');
                          //Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Add Customer',style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: Colors.white,
                            fontSize: 18,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*Future<void> scheduleAPushNotification(String customerName,DateTime endDate) async {

    String? token = await FirebaseMessaging.instance.getToken();


    //Schedules a notification to the topic 'any' for next minute
    final String _payload = {
      'to': token,
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "show_in_foreground": true,
      "notification": {
        "title": customerName+"\'s",
        "body": "Subscription Ends Today"
      },
      "data": {"key_1": "Value for key_1", "key_2": "Value for key_2"}
    }.toString();
    final DateTime _now = DateTime.now().toUtc();
    final DateTime _dateTimeInUtc = _now.add(const Duration(minutes: 1));

    await firebaseNotificationScheduler.scheduleNotification(
        payload: _payload, dateTimeInUtc: _dateTimeInUtc);
  }*/

  Future<void> scheduleAPushNotification(String customerName,DateTime endDate) async {

    String? token = await FirebaseMessaging.instance.getToken();


    //Schedules a notification to the topic 'any' for next minute
    final String _payload = {
      'to': token,
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "show_in_foreground": true,
      "notification": {
        "title": customerName+"\'s",
        "body": "Subscription Ends Today"
      },
      "data": {"key_1": "Value for key_1", "key_2": "Value for key_2"}
    }.toString();
    final DateTime _now = DateTime.now().toUtc();
    final DateTime _dateTimeInUtc = _now.add(const Duration(minutes: 1));

    await firebaseNotificationScheduler.scheduleNotification(
        payload: _payload, dateTimeInUtc: _dateTimeInUtc);
  }


}
