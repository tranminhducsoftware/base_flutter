
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return;
        });


  }
}
