import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final double? profileHeight;
  final double? profileWidth;

  const Profile({
    super.key,
    this.profileHeight,
    this.profileWidth,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            height: widget.profileHeight ?? size.height * 0.25,
            width: widget.profileWidth ?? size.width * 0.43,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    (widget.profileWidth ?? size.width * 0.43) * 0.5)),
            child: Image.asset(
              'assets/images/profile.png',
            ),
          ),
          SizedBox(height: (widget.profileHeight ?? size.height * 0.25) * 0.04),
          Container(
            child: Text(
              "Profile Name",
              style: TextStyle(
                  fontSize: (widget.profileWidth ?? size.width * 0.43) * 0.18,
                  fontFamily: "ZillaSlab",
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
