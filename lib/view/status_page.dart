import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_page.dart';



class StatusPage extends ConsumerWidget{
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        body: AuthPage()
    );
  }
}
