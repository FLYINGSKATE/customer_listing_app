
import 'package:customer_listing_app/utils/AuthenticationHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRepository{



  //Add Customer
  Future<bool> AddCustomer(
      String address,
      String area,
      String caseID,
      String eggName,
      DateTime endDate,
      DateTime startDate,
      String customerName,
      String remark,
      String unit,
      String ws,
      String customerMobileNumber,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? mailId = await prefs.getString('mail_id');
    print("mailId");
    print(mailId);
    if(mailId==null){
      return false;
    }
    //print("Adding"+contact.displayName!);
    bool isCustomerAddedSuccessfully = false;
    try {
      await FirebaseFirestore.instance.collection("/"+mailId).doc("/UserDetails").collection("/customers").doc().set({
        "address":address,
        "area":area,
        "case_id":caseID,
        "customer_name":customerName,
        "egg_name":eggName,
        "end_date":endDate,
        "mobile_number":customerMobileNumber,
        "remark":remark,
        "start_date":startDate,
        "unit":unit,
        "w_s":ws,
        //"SocialMedia":contact.socialMedias![0],
        //"Account":contact.accounts![0],
      }).then((value) {
        isCustomerAddedSuccessfully = true;
      }).onError((error, stackTrace) {
        isCustomerAddedSuccessfully = false;
      }).whenComplete(() {
        isCustomerAddedSuccessfully = true;
      });
    } catch (e) {
      print("Exception");
      print(e);
      isCustomerAddedSuccessfully = false;
    }
    return isCustomerAddedSuccessfully;
  }


  //Fetch Customer Lists
  Future<List<DocumentSnapshot>?> FetchListOfCustomers() async {
    List<DocumentSnapshot>? docs;
    final prefs = await SharedPreferences.getInstance();
    String? mailId = await prefs.getString('mail_id');
    print("mailId");
    print(mailId);
    if(mailId==null){
      return null;
    }
    //print("Adding"+contact.displayName!);
    bool isCustomerAddedSuccessfully = false;
    try {
      await FirebaseFirestore.instance.collection("/"+mailId).doc("/UserDetails").collection("/customers").get().then((value) {
        docs = value.docs;
      }).onError((error, stackTrace) {
        print("Error Aaya hai!!!");
        print(error);
        return null;
      });
    } catch (e) {
      print("Exception");
      print(e);
      return null;
    }
    return docs;
  }



  //Fetch Notifications Lists
  Future<List<DocumentSnapshot>?> FetchListOfNotifications() async {
    //Get Only Users Whose end dates are passed

    List<DocumentSnapshot>? docs;
    final prefs = await SharedPreferences.getInstance();
    String? mailId = await prefs.getString('mail_id');
    if(mailId==null){
      return null;
    }
    //print("Adding"+contact.displayName!);
    bool isCustomerAddedSuccessfully = false;
    try {
      await FirebaseFirestore.instance.collection("/"+mailId).doc("/UserDetails").collection("/customers").where("end_date", isLessThanOrEqualTo: new DateTime.now()).get().then((value) {
        docs = value.docs;
      }).onError((error, stackTrace) {
        return null;
      });
    } catch (e) {
      print("Exception");
      print(e);
      return null;
    }
    return docs;
  }


  //Sign In
  //Sign Up
  //Add User
  Future<bool> AddUser(String? mailId,String? password) async {
    //print("Adding"+contact.displayName!);

    bool signUpSuccessfull = await AuthenticationHelper().signUp(mailId,password);
    if(!signUpSuccessfull){
      return false;
    }


    final CollectionReference customerRef = FirebaseFirestore.instance.collection('/customers');

    bool isUserAddedSuccessfully = false;
    try {
      await FirebaseFirestore.instance.collection("/"+"$mailId").doc("/UserDetails").set({
        "mail_id":"$mailId",
      }).then((value) {
        isUserAddedSuccessfully = true;
      }).onError((error, stackTrace) {
        isUserAddedSuccessfully = false;
      }).whenComplete(() {

        isUserAddedSuccessfully = true;
      });
    } catch (e) {
      print("Exception");
      print(e);
      isUserAddedSuccessfully = false;
    }

    if(isUserAddedSuccessfully){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('mail_id',mailId!);
    }

    return isUserAddedSuccessfully;
  }


  ///Delete Customer
  ///uPDATE END DATE OF CUSTOMER






}