import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

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
