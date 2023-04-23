import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/screens/contact_chat_screen.dart';
import 'package:whatsapp_clone/screens/mobile_layout_screen.dart';

import '../colors.dart';

class MobileChatScreen extends StatefulWidget {
  final String title;
  final String image;
  const MobileChatScreen({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  State<MobileChatScreen> createState() => _MobileChatScreenState();
}

class _MobileChatScreenState extends State<MobileChatScreen> {
  late final TextEditingController _typeMessage;
  int _activeSuffixIconIndex = 0;
  // List of suffix icons
  List<IconData> _suffixIcons = [
    Icons.attach_file_rounded,
    Icons.currency_rupee_rounded,
    Icons.camera_alt_rounded,
  ];
  List<Widget> selectedIcons = [];
  bool showEmoji = false;

  FocusNode focusNode = FocusNode();

  Icon _emojiIcon = const Icon(
    Icons.emoji_emotions_rounded,
    color: iconColor,
    size: 20,
  );

  @override
  void initState() {
    super.initState();

    _typeMessage = TextEditingController();
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          setState(() {
            showEmoji = false;
            _emojiIcon = const Icon(
              Icons.emoji_emotions_rounded,
              color: iconColor,
              size: 20,
            );
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _typeMessage.dispose();
    super.dispose();
  }

  void _onTextChanged(String text) {
    setState(() {
      _typeMessage.text = text;
      if (text.isEmpty) {
        _suffixIcons;
      } else {
        _activeSuffixIconIndex = 1;
      }
    });
  }

  void _onSuffixIconTapped(int index) {
    setState(() {
      _activeSuffixIconIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: chatScreenBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.arrow_back,
                ),
              )),
          leadingWidth: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width - 16),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(widget.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        '05:59',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(
              child: ContactChatScreen(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: TextField(
                                  focusNode: focusNode,
                                  cursorColor: Colors.black,
                                  controller: _typeMessage,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type Here",
                                    prefixIcon: IconButton(
                                      icon: _emojiIcon,
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          showEmoji = !showEmoji;
                                          _emojiIcon = const Icon(
                                              FontAwesomeIcons.keyboard);
                                        });
                                      },
                                    ),
                                    suffixIcon: const Icon(
                                      FontAwesomeIcons.paperclip,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 12),
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: const Icon(
                                FontAwesomeIcons.microphone,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              padding: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                              child: const Icon(
                                FontAwesomeIcons.shareNodes,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // showEmoji ? showEmojiPicker() : Container(),
              ],
            ),
          ],
        ),
      ),
      onWillPop: () {
        if (showEmoji) {
          setState(() {
            showEmoji = false;
          });
        } else {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
    );
  }

  // Widget showEmojiPicker() {
  //   return EmojiPicker(
  //     rows: 4,
  //     columns: 7,
  //     onEmojiSelected: (emoji, category) {
  //       print(emoji);
  //       _typeMessage.text = _typeMessage.text + emoji.emoji;
  //     },
  //   );
  // }
}
