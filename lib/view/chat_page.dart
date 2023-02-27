import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutterpod/constant/firebase_instances.dart';

import '../providers/room_provider.dart';

class ChatPage extends StatefulWidget {
final types.Room room;

ChatPage(this.room);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final messageStream = ref.watch(messagesStream(widget.room));
          return messageStream.when(
              data: (data){
                return  Chat(
                  messages: data,
                //  onAttachmentPressed: _handleAttachmentPressed,
                  onSendPressed: (PartialText val) {
                    print('hello');
                    try{
                      FirebaseInstances.fireChat.sendMessage(val.text, widget.room.id);
                    }catch (err){
                      print(err);
                    }

                  },
                  showUserAvatars: true,
                  showUserNames: true,
                  user: types.User(
                      id: FirebaseInstances.fireChat.firebaseUser!.uid
                  ),
                );
              },
              error: (err, stack) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          );
        }
      ),
    );
  }



}
