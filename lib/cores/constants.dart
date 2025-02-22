import 'package:electronicsshop_app/cores/app_exports.dart';


var textInputDecoration = InputDecoration(
  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
  fillColor: Colors.transparent,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide:
    BorderSide(color: Colors.grey[400]!), // Set the default border color
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.black),
  ),
);