import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/homepage_cubit.dart';
import 'package:to_do_application/cubit/works_detail_cubit.dart';
import 'package:to_do_application/cubit/works_cubit.dart';
import 'package:to_do_application/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorksCubit(),
        ),
        BlocProvider(
          create: (context) => WorksDetailCubit(),
        ),
        BlocProvider(
          create: (context) => HomepageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
      ),
    );
  }
}
