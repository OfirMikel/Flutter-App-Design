import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/app_cubit.dart';
import 'package:untitled/cubit/app_cubit_states.dart';
import 'package:untitled/pages/detail_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/navpages/main_page.dart';
import 'package:untitled/pages/welcome_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context , state){
          if(state is WelcomeState){
            return WelcomePage();
          }if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }if(state is LoadedState){
            return  MainPage();
          }if(state is DetailState){
            return  DetailPage();
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
