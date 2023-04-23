import 'package:equatable/equatable.dart';

class AllChatsModel extends Equatable {
  const AllChatsModel({
    required this.image,
    required this.name,
    required this.chat,
    required this.chatTime,
  });
  final String image;
  final String name;
  final String chat;
  final String chatTime;

  @override
  List<Object> get props => [image, name, chat, chatTime];

  static List<AllChatsModel> chatlist1 = [
    const AllChatsModel(
        image: 'assets/images/image1.jpg',
        name: 'Contact1',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image2.jpg',
        name: 'Contact2',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image3.jpg',
        name: 'Contact3',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image4.jpg',
        name: 'Contact4',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image5.jpg',
        name: 'Contact5',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image6.jpg',
        name: 'Contact6',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image7.jpg',
        name: 'Contact7',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image8.jpg',
        name: 'Contact8',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image9.jpg',
        name: 'Contact9',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
    const AllChatsModel(
        image: 'assets/images/image10.jpg',
        name: 'Contact10',
        chat: 'Here you see last chat of us....',
        chatTime: '00:00'),
  ];
  @override
  bool get stringify => false;
}

class ChatMessagesModel extends Equatable {
  const ChatMessagesModel({
    required this.isMe,
    required this.message,
    required this.chatTime,
  });
  final bool isMe;
  final String message;
  final String chatTime;

  @override
  List<Object> get props => [isMe, message, chatTime];

  static List<ChatMessagesModel> chatMessagesList1 = [
    const ChatMessagesModel(isMe: false, message: 'Hi', chatTime: '10:00 AM'),
    const ChatMessagesModel(isMe: true, message: 'Hey', chatTime: '10:02 AM'),
    const ChatMessagesModel(
        isMe: false, message: 'How are you!!', chatTime: '10:05 AM'),
    const ChatMessagesModel(
        isMe: true,
        message: "I am fine...How's about you.",
        chatTime: '10:08 AM'),
    const ChatMessagesModel(
        isMe: false, message: 'Awesome....', chatTime: '10:10 AM'),
    const ChatMessagesModel(
        isMe: true, message: 'How is your work??', chatTime: '5:00 PM'),
    const ChatMessagesModel(
        isMe: false, message: "Yeah!!! It's great..", chatTime: '6:30 PM'),
    const ChatMessagesModel(
        isMe: false,
        message: 'And how is your work and your coding also...',
        chatTime: '6:32 PM'),
    const ChatMessagesModel(
        isMe: true, message: "Yeah fine.", chatTime: '6:35 AM'),
    const ChatMessagesModel(
        isMe: false, message: 'Ok.. Good Night!!', chatTime: '11:00 PM'),
    const ChatMessagesModel(
        isMe: true, message: 'Good Night!!', chatTime: '11:02 PM'),
  ];
  @override
  bool get stringify => false;
}
