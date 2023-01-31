import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_provider.dart';



class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print('build it');
    return Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
          //  final number = ref.watch(counterProvider).number;
            final number = ref.watch(countStateProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$number', style: TextStyle(fontSize: 50),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                     //   ref.read(counterProvider).add();
                          ref.read(countStateProvider.notifier).state++;
                        }, child: Text('add', style: TextStyle(fontSize: 30),)),
                    TextButton(
                        onPressed: () {
                       //   ref.read(counterProvider).minus();
                          ref.read(countStateProvider.notifier).state--;
                        },
                        child: Text('minus', style: TextStyle(fontSize: 30),)),
                  ],
                )
              ],
            );
          }
        )
    );
  }
}
