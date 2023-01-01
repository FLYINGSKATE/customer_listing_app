import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomThemes {

  static const typeTheme = Typography.whiteMountainView;

  static final light = ThemeData(fontFamily: GoogleFonts.poppins().fontFamily,).copyWith(

    listTileTheme: const ListTileThemeData(
      iconColor: Colors.red,
    ),

    scaffoldBackgroundColor: Color(0xffF1F4F8),
    backgroundColor: Color(0xffF1F4F8),
    primaryColor: Color(0xff4B39EF),
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    cardColor: Colors.black,
    secondaryHeaderColor: Color(0xffF6F7F9),

    //primaryColor:Kolors.primaryBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // background (button) color
        foregroundColor: Color(0xff4B39EF),
        textStyle:GoogleFonts.poppins(
          textStyle: TextStyle(fontFamily: 'Outfit',
            color: Color(0xFF4B39EF),
            fontSize: 16,
            fontWeight: FontWeight.normal,),
        ),

      ),
    ),

    textTheme: GoogleFonts.poppinsTextTheme(
        Typography.whiteMountainView.copyWith(

          bodyText1: typeTheme.bodyText1?.copyWith(fontSize: 15.0,
              fontWeight: FontWeight.w400,

              fontStyle: FontStyle.normal,
              color: Color(0xff4D4D4D)),
          headline1: typeTheme.headline1?.copyWith(
              fontWeight: FontWeight.w700),


          //bodySmall: typeTheme.subtitle2?.copyWith(color: Kolors.primaryText, fontSize: 8.5.sp, fontWeight: FontWeight.w400),
        )
    ).apply(bodyColor: Colors.black,displayColor: Colors.black),


  );

  /*static final dark = ThemeData.dark().copyWith(
      scaffoldBackgroundColor:Color(0xff0D0F16),
      tabBarTheme:  TabBarTheme(
        labelColor: Color(0xffededed),
        labelStyle: TextStyle(color: Color(0xff3151e0)), // color for text
        indicator: UnderlineTabIndicator( // color for indicator (underline)
            borderSide: BorderSide(color: Color(0xff3151e0))),
      ),
      //backgroundColor: Color(0xff0D0F16),
      canvasColor: Color(0xff0D0F16),
      accentColor:Color(0xff3151E0),
      buttonColor:Color(0xff2E3192),
      cardColor:Color(0xff14151A),
      primaryColor: Color(0xff131520),
      secondaryHeaderColor: Color(0xff131520),
      textTheme: GoogleFonts.montserratTextTheme(
          Typography.whiteMountainView.copyWith(
            ///Menu List Drawer Texts Color
              bodyText1: typeTheme.bodyText1?.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
              //Home Screen Label Text
              labelMedium: typeTheme.labelMedium?.copyWith(
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
              bodyText2: typeTheme.bodyText2?.copyWith(fontSize: 14),
              headline1: typeTheme.headline1?.copyWith(
                  color: Color(0xffffffff),
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w100),
              headline2: typeTheme.headline2?.copyWith(color: Kolors.primaryIcon,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
              headline3: typeTheme.headline3?.copyWith(color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
              headline4: typeTheme.headline4?.copyWith(
                  fontSize: 13.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal),
              //Tab Bar Text
              headline5: typeTheme.headline5?.copyWith(
                  fontSize: 13.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
              headline6: typeTheme.headline6?.copyWith(fontSize: 16),
              subtitle2: typeTheme.subtitle2?.copyWith(fontSize: 21),
              subtitle1: typeTheme.subtitle1?.copyWith(color: Color(0xffb3b3b3),
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w500)
            //bodySmall: typeTheme.subtitle2?.copyWith(color: Colors.white, fontSize: 8.5.sp, fontWeight: FontWeight.w400),
          )
      ),
      splashColor: Color(0xff2E3192),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(Kolors.primaryBlue),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff131520),
          // This will be applied to the "back" icon
          iconTheme: IconThemeData(color: Color(0xffB3B3B3)),
          // This will be applied to the action icon buttons that locates on the right side
          actionsIconTheme: IconThemeData(color: Color(0xffB3B3B3)),
          centerTitle: false,
          elevation: 15,
          titleTextStyle: TextStyle(color: Color(0xffB3B3B3))
      ),
      inputDecorationTheme:InputDecorationTheme(
          filled: true,
          fillColor: Color(0xff0B0D13),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.5.w)),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.5.w)),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.5.w)),
            borderSide: BorderSide(
                color: Kolors.primaryText.withOpacity(0.5),
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.5.w)),
              borderSide: BorderSide(
                  color: Kolors.primaryText.withOpacity(0.5),
                  width: 1))
      )
  );*/
}