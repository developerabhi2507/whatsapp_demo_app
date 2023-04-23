import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/models.dart';

import 'message_card.dart';
import 'sender_message_card.dart';

class ContactChatScreen extends StatefulWidget {
  const ContactChatScreen({super.key});

  @override
  State<ContactChatScreen> createState() => _ContactChatScreenState();
}

class _ContactChatScreenState extends State<ContactChatScreen> {
  List<ChatMessagesModel> chatMessagesModel =
      List.from(ChatMessagesModel.chatMessagesList1);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: chatMessagesModel.length,
        itemBuilder: (context, index) {
          if (chatMessagesModel[index].isMe == true) {
            return MessageCard(
              message: chatMessagesModel[index].message,
              date: chatMessagesModel[index].chatTime,
            );
          }
          return SenderMessageCard(
            message: chatMessagesModel[index].message,
            date: chatMessagesModel[index].chatTime,
          );
        });
  }
}
