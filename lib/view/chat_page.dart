import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpod/providers/common_provider.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/firebase_instances.dart';
import '../providers/room_provider.dart';

class ChatPage extends StatefulWidget {
  final types.Room room;
  const ChatPage({required this.room});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _isAttachmentUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final roomMessage = ref.watch(messagesStream(widget.room));

        return roomMessage.when(
            data: (data) {
              return Chat(
                showUserAvatars: true,
                showUserNames: true,
                isAttachmentUploading: _isAttachmentUploading,
                messages: data,
                onAttachmentPressed: () {
                  final ImagePicker _picker = ImagePicker();
                  _picker.pickImage(source: ImageSource.gallery).then((value)async {
                    if(value != null){
                      setState(() {
                        _isAttachmentUploading = true;
                      });
                      final ref = FirebaseInstances.fireStorage.ref().child('chatImage/${value.name}');
                      await ref.putFile(File(value.path));
                      final url = await ref.getDownloadURL();
                      setState(() {
                        _isAttachmentUploading = false;
                      });
                      final imageMessage = types.PartialImage(
                        name: value.name,
                        uri: url,
                        size:  File(value.path).lengthSync()
                      );
                      FirebaseChatCore.instance.sendMessage(
                        imageMessage,
                        widget.room.id,
                      );
                    }
                  });



                },
                onSendPressed: (types.PartialText message) {
                  FirebaseChatCore.instance.sendMessage(
                    message,
                    widget.room.id,
                  );
                },
                user: types.User(
                  id: FirebaseChatCore.instance.firebaseUser!.uid,
                ),
              );
            },
            error: (err, stack) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }

  void _setAttachmentUploading(bool uploading) {
    setState(() {
      _isAttachmentUploading = uploading;
    });
  }
}
