import 'package:base_flutter/src/core/auth/bloc/auth_bloc/auth.dart';
import 'package:base_flutter/src/core/auth/bloc/login_bloc/login_bloc.dart';
import 'package:base_flutter/src/core/auth/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(userRepository: userRepository,),
      ),
    );
  }
}