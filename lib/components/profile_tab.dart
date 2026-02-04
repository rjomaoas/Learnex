import 'package:flutter/material.dart';

// Components
import 'package:learnex_app/components/profile.dart';
import 'package:learnex_app/components/score_board.dart';

class ProfileTab extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final String? profileLabelName;
  final double? profileHeight;
  final double? profileWidth;

  const ProfileTab({
    super.key,
    required this.onMenuPressed,
    this.profileLabelName,
    this.profileHeight,
    this.profileWidth,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(size.width * 0.1),
          bottomRight: Radius.circular(size.width * 0.1),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 5, 16, 26),
            Color.fromARGB(255, 10, 32, 53),
            Color.fromARGB(255, 30, 43, 113),
            Color.fromARGB(255, 10, 32, 53),
            Color.fromARGB(255, 5, 16, 26),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: size.height * 0.05,
              ),
              onPressed: onMenuPressed,
            ),
          ),
          const SizedBox(height: 8),
          Profile(profileHeight: profileHeight, profileWidth: profileWidth),
          if (profileLabelName == "Scores") ScoreBoard()
        ],
      ),
    );
  }
}
