

import 'package:flutter/material.dart';

Container numContainer(
    {required String num, bool? guess = true, double? size = 70}) {
  return Container(
    alignment: Alignment.center,
    width: guess! ? 60 : size,
    height: guess ? 60 : size,
    decoration: BoxDecoration(
        color: guess
            ? Colors.blue.withOpacity(0.10)
            : Colors.blue.withOpacity(0.30),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.7))),
    child: Text(
      num,
      style: const TextStyle(fontSize: 25, color: Colors.white),
    ),
  );
}

InkWell pickContainer(
    {required String num, bool? guess = true, required VoidCallback onTap}) {
  return InkWell(
    splashColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: guess!
              ? Colors.blue.withOpacity(0.10)
              : Colors.blue.withOpacity(0.30),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withOpacity(0.50))),
      child: Text(
        num,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    ),
  );
}
