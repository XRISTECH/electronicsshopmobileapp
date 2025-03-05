import 'package:electronicsshop_app/cores/app_exports.dart';

const host = 'https://e-store-api-57kb.onrender.com';

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

var inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: Colors.grey[400]!),
);
