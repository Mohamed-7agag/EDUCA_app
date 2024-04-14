import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_image_course.dart';

class CourseListViewItem extends StatelessWidget {
  const CourseListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: SizedBox(
        height: 175.h,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "رياضيات",
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "5h 24m",
                                  style: Styles.textStyle14.copyWith(
                                    color: const Color(0xff4F4F4F),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                // const Icon(
                                //   Icons.schedule,
                                //   size: 22,
                                // ),
                              ],
                            ),
                          ),
                          Text(
                            "10 درس",
                            style: Styles.textStyle14
                                .copyWith(color: const Color(0xff4F4F4F)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "طالب 245",
                            style: Styles.textStyle14
                                .copyWith(color: const Color(0xff4F4F4F)),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.group_outlined,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "View",
                            onpressed: () {},
                            textStyle: Styles.textStyle16
                                .copyWith(color: const Color(0xff333333)),
                            backroundcolor: kBackgroundColor,
                            rectangleBorder: const RoundedRectangleBorder(
                              side:  BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                              text: "Discuss",
                              onpressed: () {},
                              textStyle: Styles.textStyle16
                                  .copyWith(color: const Color(0xff333333)),
                              backroundcolor: kBackgroundColor,
                              rectangleBorder: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            const CustomImgeCourse(),
          ],
        ),
      ),
    );
  }
}
