
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/Network/header.dart';

class NetworkHandler{

    String  baseUrl = "http://localhost:3000";

//logger..
      var log = Logger();

//getapi..
      Future get(String url)async{
        url = formate(url);
        print(url);
         var response = await http.get(url);
         if(response.statusCode == 200 ||response.statusCode == 201){
         log.i(response.body);
         log.i('sadasdasdd');
         
         print(response.body);
         return  json.decode(response.body);
         }
        log.d(response.body);
        log.d(response.statusCode);   
         return  json.decode(response.body);
      }


//postapi..
        Future post(String url,Map<String,String> body)async{
        url = formate(url);
        print( header.customHeaders);
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          header.customHeaders['Authorization']  = sharedPreferences.getString('token');
        var response = await http.post(url,headers: header.customHeaders,body: jsonEncode(body));
        if(response.statusCode == 200 ||response.statusCode == 201){
         log.i(response.body);
         return  json.decode(response.body);
         }
        log.d(response.body);
        log.d(response.statusCode);
         return  json.decode(response.body);
      }




    String formate(String url){
      return baseUrl+url;
    }
}