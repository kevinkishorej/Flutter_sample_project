
import 'package:flutter/material.dart';
import 'package:training/pages/singin.dart';
import 'package:training/pages/singup.dart';

class welcome extends StatefulWidget {

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> with TickerProviderStateMixin{
  
  //animation....
  AnimationController _controller;
  Animation<Offset> animation1;
 //animation2...
   AnimationController _controller2;
  Animation<Offset> animation2;
  
  @override
  @override
  void initState() { 
    super.initState();
    ///animation1....
    _controller = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation1 = Tween<Offset>(
      begin: Offset(0.0,5.0),
      end: Offset(0.0,0.0),
    ).animate(CurvedAnimation(parent: _controller,curve: Curves.easeOut));
   ///animation2....
    _controller2 = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation2 = Tween<Offset>(
      begin: Offset(0.0,5.0),
      end: Offset(0.0,0.0),
    ).animate(CurvedAnimation(parent: _controller2,curve: Curves.easeInOut));



    //forward palce...
    _controller.forward();
    _controller2.forward();
  }


  @override
  void dispose() { 
          _controller.dispose();  
          _controller2.dispose();
    super.dispose();
  }
  
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
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
         child: Column(
          children: [
            SlideTransition(position: animation1,
             child:Text('Devstack',
            textAlign: TextAlign.center,
            style: TextStyle(
             fontSize: 38,
             fontWeight: FontWeight.w600,
             letterSpacing: 2
            ),
            ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/6),
            SlideTransition(position: animation1,
                child: Text('Greate story for greate persion',
               textAlign: TextAlign.center,
              style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 38,
               letterSpacing: 2 
              ),),
            ),
            SizedBox(height: 10),
             boxContainer('assets/png-clipart-google-logo-g-suite-google-guava-google-plus-company-text.png', 'Singin with Google',null),
             SizedBox(height: 10),
            boxContainer('assets/face-logo-png-6-1-Transparent-Images.png', 'Singin with Fackbooke',null),
             SizedBox(height: 10),
            boxContainer('assets/download.png', 'Singin with Gmail',sing_up_function),
             SizedBox(height: 10),
            SlideTransition(position: animation2,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Already have an account ? ',style:TextStyle(
                   color: Colors.grey,fontSize: 17
                   )),
                 SizedBox(width: 10),

                 Text('Sing in',style: TextStyle(fontSize: 17,color: Colors.green,fontWeight: FontWeight.w600),)
               ], 
              ),
            )
          ],
         ),
       ),
      ),
    );
  }

sing_up_function(){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>log_in()));
}

  Widget boxContainer(String path, String text,onClick){
    return  SlideTransition(position: animation2,
          child: InkWell(
            onTap: onClick,
      child: Container(
            
        height: 60,
        width: 250,
        child: Card(
             child:  Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
         children: [
         Image.asset(
               path,
               height: 40,
               width: 40,
         ) ,
         Text(text,style: TextStyle(
       
               fontSize: 16,
               color: Colors.black87
         ),)
         ], 
        ),
             ),
        )
        
       
      ),
          ),
    );
  }
}