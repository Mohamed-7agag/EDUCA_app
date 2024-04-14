import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../home_teacher/presentation/views/home_view.dart';

class CustomBottomBarForTeacherView extends StatefulWidget {
  const CustomBottomBarForTeacherView({super.key});

  @override
  State<CustomBottomBarForTeacherView> createState() =>
      _CustomBottomBarForTeacherViewState();
}

class _CustomBottomBarForTeacherViewState
    extends State<CustomBottomBarForTeacherView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Colors.grey.shade200, width: 0.6)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: GNav(
            gap: 8,
            selectedIndex: index,
            tabBackgroundColor: kSplashColor,
            activeColor: kPrimaryColor,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
            onTabChange: (value) {
              setState(() {
                index = value;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.account_circle_outlined,
                iconSize: 27,
                text: "أنا",
              ),
              GButton(
                icon: Icons.beenhere_outlined,
                text: "كورساتي",
              ),
              GButton(
                icon: Icons.home_outlined,
                text: "الرئيسية",
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: IndexedStack(
        index: index,
        children: [
          //const ProfileView(),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'courses',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'cohhurses',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),

          const HomeTeacherView()
        ],
      )),
    );
  }
}
