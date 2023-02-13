import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';


class ConnectionWidget extends StatelessWidget {
  final Widget widget;
  ConnectionWidget({required this.widget});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (c, connection, child) {
        final bool connected = connection != ConnectivityResult.none;
      //  return connected ? widget : Center(child: Text('No Internet'));
        return widget ;
      },
      child: Container(),

    );
  }
}
