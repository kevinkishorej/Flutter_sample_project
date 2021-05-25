import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/pages/Welcom.dart';
import 'package:flutter/scheduler.dart';
import 'package:training/pages/home.dart';

 void main(){
    runApp(Myapp());
 }

// class Myapp extends StatelessWidget {
//   Widget  page = welcome();
// @override

// void initState() { 

//   check_log();
// }
// void check_log()async{
//       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
           
//     String token = sharedPreferences.getString('token');
//     print(token);
//       print('token');
//     if(token != null){
//       page = home();
//     }else{
//       page = welcome();
//     }
//   }
//   @override

    
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: page,
//     );
//   }
// }
 





class Myapp extends StatefulWidget {


  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
    Widget  page = welcome();
    @override

void initState() { 
    super.initState();
  check_log();
}
void check_log()async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
           
    String token = sharedPreferences.getString('token');
    print(token);
     
    if(token != null){
      setState(() {
         page = home();
       print('tosadasdken');
      });
     
    }else{
      setState(() {
           page = welcome();
      print('tosadasdk222222en');
      });
   
    }
  }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: page,
    );
  }
}