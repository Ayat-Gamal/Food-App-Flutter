import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TopPartDetailsScreen extends StatelessWidget {
  const TopPartDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(Icons.favorite_border, color: Color(MainColor)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
