import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:neobis_flutter_hello_flutter/data/task.dart';

// ignore: must_be_immutable
class FloatActButton extends StatefulWidget {
  dynamic addTask;

  FloatActButton(this.addTask, {super.key});

  @override
  State<FloatActButton> createState() => _FloatActButtonState();
}

class _FloatActButtonState extends State<FloatActButton> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              TextEditingController controller = TextEditingController();
              return AlertDialog(
                title: const Text('Add a Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: controller,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                          hintText: 'Task Title...',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field ';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.addTask(
                              Task(
                                task: controller.text,
                              ),
                            );
                            controller.text = '';
                            Navigator.pop(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Icon(
                              CupertinoIcons.check_mark,
                              color: Colors.green,
                            ))),
                  )
                ],
              );
            });
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(
        CupertinoIcons.add,
        color: Colors.black,
      ),
    );
  }
}
