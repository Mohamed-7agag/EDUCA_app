import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../view_model/bottom_bar_cubit.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 0.6)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: GNav(
                gap: 8,
                selectedIndex: state,
                tabBackgroundColor: kSplashColor,
                activeColor: kPrimaryColor,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 12, bottom: 12),
                onTabChange: (value) {
                  context.read<BottomBarCubit>().changeBottomBarIndex(value);
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
                    icon: Icons.home_filled,
                    text: "الرئيسية",
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
              child: IndexedStack(
            index: state,
            children: [
              const ProfileView(),
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
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'main',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
