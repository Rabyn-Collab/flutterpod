import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpod/constant/firebase_instances.dart';

import '../services/auth_service.dart';


class HomePage extends ConsumerWidget {

final userId = FirebaseInstances.firebaseAuth.currentUser!.uid;
  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(userStream(userId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Chat'),
      ),
      drawer: Drawer(
        child: userData.when(
            data: (data){
              return ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(data.imageUrl!))
                    ),
                    child: Text(data.firstName!),)
                ],
              );
            },
            error: (err, stack) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator())
        ),
      ),
        body: const Placeholder()
    );
  }
}
