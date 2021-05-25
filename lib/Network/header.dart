import 'package:flutter/material.dart';


class header extends StatefulWidget {
 static Map<String, String> customHeaders = {
    'content-type': 'application/json',
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials":
        "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    'Authorization': '',
  };
  @override
  _headerState createState() => _headerState();
}

class _headerState extends State<header> {
   
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
 
}