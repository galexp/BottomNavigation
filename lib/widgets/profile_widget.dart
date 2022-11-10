import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: const Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}
