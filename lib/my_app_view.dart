import 'package:flutter/material.dart';
import 'package:neobis_flutter_hello_flutter/bloc/task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neobis_flutter_hello_flutter/home_screens/home.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks app',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Color.fromARGB(255, 248, 205, 205),
            onBackground: Colors.black,
            primary: Color.fromARGB(255, 252, 251, 251),
            onPrimary: Colors.black,
            secondary: Color.fromARGB(255, 15, 19, 12),
            onSecondary: Color.fromARGB(255, 243, 243, 243)),
      ),
      home: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc()..add(TaskStarted()),
        child: const HomeScreen(),
      ),
    );
  }
}
