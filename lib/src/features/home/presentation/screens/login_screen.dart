import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsvilecity/src/features/home/presentation/bloc/login_bloc.dart';
import 'package:nsvilecity/src/features/home/presentation/bloc/login_state.dart';
import 'package:nsvilecity/src/features/home/presentation/views/login_view.dart';

class LoginScreen extends StatelessWidget {
  final int index;

  const LoginScreen({super.key, required this.index}); 

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kulaan'),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            Future<void> _login() async {
              try {
                await FirebaseAuth.instance.signInAnonymously();
                Navigator.pushNamed(context, LoginScreen.routeName);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login failed: $e')),
                );
              }
            }
          }
        },
        builder: (_ , state) => LoginView(currentState: state,),
      ),);
  }
}