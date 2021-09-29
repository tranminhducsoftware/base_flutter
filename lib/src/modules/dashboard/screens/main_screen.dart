import 'package:base_flutter/src/constants/app_constants.dart';
import 'package:base_flutter/src/core/auth/bloc/auth_bloc/auth.dart';
import 'package:base_flutter/src/utils/services/local_notification_service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification != null){
        print(event.notification.body);
        print(event.notification.title);
      }
      LocalNotificationService.display(event);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final routeFromMessage = event.data["route"];
      print(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://yt3.ggpht.com/yti/ANoDKi5R5eJSjZigdWmIcZKFAtqwG4svMcAAN0Iyvw4j=s108-c-k-c0x00ffffff-no-rj"),
            ),
          ),
          title: Text("AUTH WITH REST"),
          actions: [
            IconButton(
                icon: Icon(EvaIcons.logOutOutline),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut(),
                  );
                })
          ],
        ),
        body: Center(
          child: Text("Main Screen"),
        ));
  }
}
