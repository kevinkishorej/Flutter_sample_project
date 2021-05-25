import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/Network/networkhandeler.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/singup.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class log_in extends StatefulWidget {
  log_in({Key key}) : super(key: key);

  @override
  _log_inState createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  bool vis = true;
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController  _usernamecontroler = TextEditingController(); 
  TextEditingController  _passwordcontroler = TextEditingController(); 
  // final storage = new FlutterSecureStorage();

    void set_storage(key,body) async {
    
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setString(key, body);
    }


  String errortext;
  bool validatore = false;
  bool circular = false;
  bool errorme = false;

  final goble_key = GlobalKey<FormState>();
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [    
             Colors.white,
             Colors.green[200]
           ],
           begin: const FractionalOffset(0.0,1.0),
           end:const FractionalOffset(0.0, 1.0),
           stops: [0.0,1.0],
           tileMode: TileMode.repeated
         )
       ),
       child: Form(
         key: goble_key,
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sing up with you email',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              letterSpacing: 2
            ),),
            SizedBox(height: 10),
            usernameField('username'),
             SizedBox(height: 10),
            // emailField('email'),
            //  SizedBox(height: 10),
            passwordField('password'),

            SizedBox(height: 10),
            InkWell(

              onTap: ()async{
                // await checkuser();
                setState(() {
                   circular = true;
                   errorme = false;
                });
                  if(goble_key.currentState.validate()){
                    Map<String,String>data={
                      'email':_usernamecontroler.text,
                
                      'password':_passwordcontroler.text,
                     
                    };
                    print(data);
                    var temp = await networkHandler.post('/user_login',data);
                     setState(() {
                     circular = false;
                    });
                    if(temp['status'] != 200){
                      setState(() {
                       print('sadadasdasdasd'); 
                      errorme = true;
                      });
                    }else{
                          print(temp);
                      errorme = false;
                     
                            print(temp['token']); 

                            print("sdsdsdsd");
                              await set_storage('token',temp['token']);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>home()));
                               
                    }
                  
                     
                  }
              },
                child: circular?CircularProgressIndicator(): Container(
                width:150,
                height:50,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(child: (Text('log in ', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),))),
              ),
            ),
             SizedBox(height: 10),
            Padding(
             padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),       
                    child: Divider(
               height: 2, 
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text('For got password ?'),
                  SizedBox(width: 50),
                         InkWell(
                             onTap: ()async{
                                 setState(() {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Sing_in()));
                                 });  
                             },
                             child: Text('New user'),
                         )
                ],
              ),
           
            
          
            
          ], 
         ),
       ),
       ),
    );
  }


checkuser()async{
  if(_usernamecontroler.text.length == 0 ){
    validatore = false;
    circular = false;
    errortext = 'user name is already exsits';
  }else{
    var response = await networkHandler.get('/exists/${_usernamecontroler.text}');
   
     print('111111111111111');
      
       print(response);
    if(response["response"] == 'user_name already exists'){
      setState(() {
         validatore = false;
        circular = false;
         errortext = 'user name is already exsits';
      });
      print('111111111111111');
      
    }else{
        setState(() {
           circular = false;
       validatore = true;
        print('111111122222211111111');
        });
       
    }
  }
}


  Widget usernameField(String lable){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      child: Column(
        children:[
        Text(lable),
        SizedBox(height: 5),
        TextFormField(
          controller: _usernamecontroler,
           validator: (value){
            if(value.isEmpty)
            return "username is required";
             return null;
          },
          decoration: InputDecoration(
            errorText: validatore ?null:errortext,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black,width: 2)
            )
          ),
        )
        ]
      ),
    );
  }



    Widget passwordField(String lable){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      child: Column(
        children:[
        Text(lable),
        SizedBox(height: 5),
        TextFormField(
          controller: _passwordcontroler,
          validator: (value){
            if(value.isEmpty)
            return "password is required";
            if(value.length <=8)
            return "password need to greater then 8";
               return null;
          },
          obscureText: vis,
          decoration: InputDecoration(
            suffixIcon: IconButton(icon: Icon(vis ? Icons.visibility : Icons.visibility_off  ),onPressed: (){
              setState(() {
                vis = !vis;
              });
            },),
            helperText: "password need to 8 charater",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black,width: 2)
            )
          ),
        )
        ]
      ),
    );
  }
}