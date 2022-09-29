import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.bold,
);

const kConditionTextStyle = TextStyle(
  fontSize: 74.0,
);

const kTextFieldProperty = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.search,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide.none,
  ),
);
