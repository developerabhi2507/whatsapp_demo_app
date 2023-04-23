import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/model/models.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/widgets/linked_devices_widget.dart';
import 'package:whatsapp_clone/widgets/new_broadcast_widget.dart';
import 'package:whatsapp_clone/widgets/new_group_widget.dart';
import 'package:whatsapp_clone/widgets/payments_widget.dart';
import 'package:whatsapp_clone/widgets/settings_widget.dart';
import 'package:whatsapp_clone/widgets/starred_messages_widget.dart';

import 'contact_chat_screen.dart';
import 'community_screen.dart';

class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  final picker = ImagePicker();
  File? _photo;

  // @override
  // void initState() {
  //   super.initState();
  //   _requestCameraPermission();
  // }

  Future<bool> _requestCameraPermission() async {
    var result = await Permission.camera.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> _requestGalleryPermission() async {
  //   var result = await Permission.photos.request();
  //   if (result == PermissionStatus.granted) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<void> _takePictureFromCamera() async {
    var cameraAllowed = await _requestCameraPermission();
    if (cameraAllowed) {
      // Access the camera and take a picture
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _photo = File(pickedFile.path);
        }
      });
    } else {
      // Show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // elevation: 0,
            title: const Text(
              'WhatsApp',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 20,
                color: titleColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              IconButton(
                  color: iconColor,
                  onPressed: () {
                    _takePictureFromCamera();
                  },
                  icon: const Icon(Icons.camera_alt_outlined)),
              IconButton(
                  color: iconColor,
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined)),
              PopupMenuButton(
                color: widgetBackgroundColor,
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: iconColor,
                ),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      textStyle: TextStyle(color: widgetTextColor),
                      value: 0,
                      child: Text('New group'),
                    ),
                    const PopupMenuItem(
                        textStyle: TextStyle(color: widgetTextColor),
                        value: 1,
                        child: Text('New broadcast')),
                    const PopupMenuItem(
                        textStyle: TextStyle(color: widgetTextColor),
                        value: 2,
                        child: Text('Linked devices')),
                    const PopupMenuItem(
                        textStyle: TextStyle(color: widgetTextColor),
                        value: 3,
                        child: Text('Starred Messages')),
                    const PopupMenuItem(
                        textStyle: TextStyle(color: widgetTextColor),
                        value: 4,
                        child: Text('Payments')),
                    const PopupMenuItem(
                        textStyle: TextStyle(color: widgetTextColor),
                        value: 5,
                        child: Text('Settings')),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    const NewGroup();
                  } else if (value == 1) {
                    const NewBroadCast();
                  } else if (value == 2) {
                    const LinkedDevices();
                  } else if (value == 3) {
                    const StarredMessages();
                  } else if (value == 4) {
                    const Payments();
                  } else if (value == 5) {
                    const Settings();
                  }
                },
              )
            ],
            bottom: TabBar(
              // isScrollable: true,
              // labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              indicatorColor: selectedTabColor,
              labelColor: selectedTabColor,
              unselectedLabelColor: unSelectedTabColor,
              tabs: [
                Tab(
                  child: Container(
                    child: const Icon(Icons.groups),
                  ),
                ),
                const Tab(
                  text: 'Chats',
                  // child: Text('Chats'),
                ),
                const Tab(
                  text: 'Status',
                ),
                const Tab(
                  text: 'Calls',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            CommunityScreen(),
            AllChatListScreen(),
            ContactChatScreen(),
            ContactChatScreen(),
          ]),
        ));
  }
}

class AllChatListScreen extends StatelessWidget {
  const AllChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AllChatsModel> allList = List.from(AllChatsModel.chatlist1);
    return ListView.builder(
        itemCount: allList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () => Get.to(MobileChatScreen(
                  title: allList[index].name,
                  image: allList[index].image,
                )),
                child: ListTile(
                  title: Text(
                    allList[index].name,
                    style:
                        const TextStyle(fontSize: 20, color: contactListColor),
                  ),
                  subtitle: Text(
                    allList[index].chat,
                    style: const TextStyle(color: chatListAndTimeColor),
                  ),
                  leading: GestureDetector(
                    onTap: () => _showDialog(
                        context, allList[index].name, allList[index].image),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(allList[index].image),
                    ),
                  ),
                  trailing: Text(
                    allList[index].chatTime,
                    style: const TextStyle(color: chatListAndTimeColor),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _showDialog(BuildContext context, String getTitle, String getImage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Image.asset(
                      getImage,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                        right: 0,
                        bottom: 0,
                        child: Text(
                          getTitle,
                          style: const TextStyle(fontSize: 20),
                        ))
                  ],
                ),
                Text(
                  getTitle,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          );
        });
  }
}
