import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neobis_flutter_hello_flutter/bloc/task_bloc.dart';
import 'package:neobis_flutter_hello_flutter/data/task.dart';
import 'package:neobis_flutter_hello_flutter/home_screens/components/floating_action_button.dart';
import 'package:neobis_flutter_hello_flutter/home_screens/components/list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  addTask(Task task) {
    context.read<TaskBloc>().add(
          AddTask(task),
        );
  }

  removeTask(Task task) {
    context.read<TaskBloc>().add(
          RemoveTask(task),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
          child: FloatActButton(addTask),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: const Text(
            'My Tasks App',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: MyListView(removeTask));
  }
}
