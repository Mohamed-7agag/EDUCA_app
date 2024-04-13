import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../Core/utils/constatnt.dart';
import '../../../../../Core/widgets/custom_button.dart';
import 'logo_page_createclass.dart';

class CreateClassViewBody extends StatelessWidget {
  const CreateClassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LogoPageCreateClass(),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Row(
            children: [
              CustomDetailsForCreateClass(
                name: "Category",
              ),
              SizedBox(
                width: 12,
              ),
              CustomDetailsForCreateClass(
                name: "Class",
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Row(
            children: [
              CustomDetailsForCreateClass(
                name: "How many Student",
              ),
              SizedBox(
                width: 12,
              ),
              CustomDetailsForCreateClass(
                name: "Duration",
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: CustomDetailsForCreateClass(
            name: "Name Your Cours?",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.only(
                  bottom: 15, top: 17, left: 85, right: 85),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          child: Text(
            "Make Your Class",
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class CustomDetailsForCreateClass extends StatelessWidget {
  const CustomDetailsForCreateClass({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                color: const Color(0xffE0E0E0),
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'e.g., blology.',
                    style: Styles.textStyle14
                        .copyWith(color: const Color(0xffBDBDBD)),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 35,
                  icon: const Icon(Icons.expand_more),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
