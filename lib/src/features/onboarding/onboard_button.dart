import 'package:flutter/material.dart';

Widget onboardButton(String text) => Container(
      height: 30,
      width: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.blue[600]),
        ),
      ),
    );
