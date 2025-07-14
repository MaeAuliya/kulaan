import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsvilecity/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:nsvilecity/src/features/home/presentation/bloc/home_state.dart';
import 'package:nsvilecity/src/features/home/presentation/views/home_view.dart';

class HomeScreen extends StatelessWidget {
  final int index;

  const HomeScreen({super.key, required this.index}); 

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kulaan'),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
        },
        builder: (_ , state) => HomeView(currentState: state,),
      ),);
  }
}