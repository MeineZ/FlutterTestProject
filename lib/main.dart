import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kla_prototype/bloc/navigation/navigation_bloc.dart';
import 'package:kla_prototype/screens/login_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  NavigationBloc navigationBloc = NavigationBloc();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => navigationBloc)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginHomeScreen(),
      ),
    );
  }
}
