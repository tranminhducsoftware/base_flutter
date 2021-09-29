import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/app_constants.dart';
import 'core/auth/bloc/auth_bloc/auth.dart';
import 'core/auth/repositories/repositories.dart';
import 'core/auth/screens/intro/intro_screen.dart';
import 'modules/dashboard/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return MainScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(kBackgroundColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(kBackgroundColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   State createState() {
//     return MyAppState();
//   }
// }
//
//
// class MyAppState extends State<MyApp> {
//   MyAppState() {
//     final router = FluroRouter();
//     Routes.configureRoutes(router);
//     Application.router = router;
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final app = MaterialApp(
//       title: 'Fluro',
//       debugShowCheckedModeBanner: false,
//       theme: theme(),
//       onGenerateRoute: Application.router.generator,
//     );
//     return app;
//   }
// }

