import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage(
      {super.key,
      required this.isUser,
      required this.date,
      required this.message});
  final bool isUser;
  final String date;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isUser == false
            ? CircleAvatar(
                backgroundColor: Colors.white,
                radius: 17,
                child: Image.asset(
                  "assets/images/chatGPT.png",
                  fit: BoxFit.fill,
                ),
              )
            : const SizedBox.shrink(),
        isUser == false ? SizedBox(width: 4.w) : const SizedBox.shrink(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8)
              .copyWith(bottom: 5),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 75.w,
          ),
          decoration: BoxDecoration(
            color: isUser == true ? kPrimaryColor : const Color(0xffEEEEEE),
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(12),
              bottomRight: const Radius.circular(12),
              topLeft:
                  isUser ? const Radius.circular(12) : const Radius.circular(2),
              topRight:
                  isUser ? const Radius.circular(2) : const Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: Styles.textStyle16.copyWith(
                    color: isUser == true ? Colors.white : Colors.black),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 5.h),
              Text(
                date,
                style: Styles.textStyle10.copyWith(
                    color: isUser == true ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
        isUser == true ? SizedBox(width: 4.w) : const SizedBox.shrink(),
        isUser == true
            ? const CircleAvatar(
                backgroundColor: kSplashMoreDarkerColor,
                radius: 17,
                child: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
