import 'package:cooking_champs/utils/curvelist.dart';
import 'package:flutter/cupertino.dart';

class CustomNavigators{

  static pushReplacementNavigate(var page ,BuildContext context){
    Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,animation,anotherAnimation){
      return page;
    }, transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder:(context,animation,anotherAnimation,child){
      animation = CurvedAnimation(parent: animation, curve:curveList[4] );
      return SlideTransition(
          position: Tween(begin:Offset(1.0,0.0),end: Offset(0.0, 0.0)).animate(animation),
      child: child);
      }
    ));
  }

  static pushNavigate(var page , BuildContext context){
    Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,anotherAnimation){
      return page;
    },
    transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context,animation,anotherAnimation,child){
      animation = CurvedAnimation(parent: animation, curve: curveList[4]);
      return SlideTransition(position: Tween(begin: Offset(1.0, 0.0),end: Offset(0.0, 0.0)).animate(animation),
      child: child);
      }
    ));
  }

  static pushRemoveUntil(var page,BuildContext context){
    Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (context,animation,anotherAnimation){
      return page;
    },
      transitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context,animation,anotherAnimation,child){
      animation = CurvedAnimation(parent: animation, curve: curveList[4]);
      return SlideTransition(position: Tween(begin: Offset(1.0, 0.0),end: Offset(0.0, 0.0)).animate(animation),
      child: child);
    }
    ),(route) =>false);
  }

  static popNavigate(BuildContext context){
    Navigator.pop(context);
  }

}