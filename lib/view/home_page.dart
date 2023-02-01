import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpod/models/todo.dart';
import 'package:flutterpod/providers/todo_provider.dart';
import 'package:get/get.dart';

import '../providers/counter_provider.dart';

class HomePage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer(builder: (context, ref, child) {
        final todoData = ref.watch(todoProvider);

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildColumn('hello', 90),
              _buildColumn('hello1', 9000),
              TextFormField(
                controller: textController,
                onFieldSubmitted: (val) {
                  if (val.isEmpty) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('you have to add some todo')));
                  } else {
                    final todo =
                        Todo(dateTime: DateTime.now().toString(), todo: val);
                    ref.read(todoProvider.notifier).add(todo);
                    textController.clear();
                  }
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    border: OutlineInputBorder(),
                    hintText: 'add some todo'),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: todoData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.account_box_outlined),
                        title: Text(todoData[index].todo),
                        subtitle: Text(todoData[index].dateTime),
                        trailing: Container(
                          width: 97,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: 'Update Todo',
                                      content: TextFormField(
                                        initialValue: todoData[index].todo,
                                        onFieldSubmitted: (val) {
                                          if (val.isEmpty) {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration:
                                                        Duration(seconds: 1),
                                                    content: Text(
                                                        'you have to add some todo')));
                                          } else {
                                            final todo = Todo(
                                                dateTime:
                                                    DateTime.now().toString(),
                                                todo: val);
                                            ref
                                                .read(todoProvider.notifier)
                                                .update(todo, index);
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            border: OutlineInputBorder(),
                                            hintText: 'add some todo'),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: 'Hold On',
                                        content: Text('Are you sure'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                ref
                                                    .read(todoProvider.notifier)
                                                    .remove(todoData[index]);
                                              },
                                              child: Text('yes')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('no')),
                                        ]);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.pink,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      }),
    ));
  }

  Column _buildColumn(String label, int age) {
    return Column(
      children: [
        Text(label), Text('$age')
      ],
    );
  }
}
