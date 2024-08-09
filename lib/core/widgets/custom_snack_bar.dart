  import 'package:flutter/material.dart';

void customSnakBar(BuildContext context, String errMessage) {
       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errMessage),
      ),
    );
  }