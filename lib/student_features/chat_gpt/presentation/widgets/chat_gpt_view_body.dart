// ignore_for_file: must_be_immutable

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

import 'custom_message.dart';

class ChatGPTViewBody extends StatefulWidget {
  const ChatGPTViewBody({super.key});

  @override
  State<ChatGPTViewBody> createState() => _ChatGPTViewBodyState();
}

class _ChatGPTViewBodyState extends State<ChatGPTViewBody> {
  TextEditingController chatController = TextEditingController();

  final chatAPIKey = 'AIzaSyDItXrIiIFrcSwFOmtfv6LwB4X4IIs8IJE';

  List<CustomMessage> messages = [];

  Future<void> talkWithGemini() async {
    setState(() {
      messages.add(CustomMessage(
        message: chatController.text,
        isUser: true,
        date: DateTime.now().toString(),
      ));
    });
    final model = GenerativeModel(model: 'gemini-pro', apiKey: chatAPIKey);
    final content = [Content.text(chatController.text)];
    final response = await model.generateContent(content);

    setState(() {
      messages.add(CustomMessage(
        message: response.text ?? '',
        isUser: false,
        date: DateTime.now().toString(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: CustomMessage(
                  isUser: messages[index].isUser,
                  message: messages[index].message,
                  date: DateFormat('hh:mm')
                      .format(DateTime.parse(messages[index].date)),
                  //date: messages[index].date,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    cursorColor: kPrimaryColor,
                    keyboardType: TextInputType.multiline,
                    cursorRadius: Radius.circular(10.r),
                    cursorHeight: 30.h,
                    controller: chatController,
                    decoration: const InputDecoration(
                        hintText: "ChatGPT تحدث مع",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: kPrimaryColor),
                        )),
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: () {
                    talkWithGemini();
                    chatController.clear();
                  },
                  icon: const Icon(Icons.send_rounded, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize: Size.fromRadius(23.r),
                    padding: EdgeInsets.only(left: 5.w),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
