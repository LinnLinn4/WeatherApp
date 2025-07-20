import 'package:flutter/material.dart';

class MyStyle{
  Container myLogo() {
    return Container(
        width: 100,
        child: Image.asset('images/rsu.png')
    );
  }

  Text showTextTitle(String strTitle) => Text(
    strTitle,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.blue,
    ),
  );

  Text showTextHeader(String strHeader) {
    return Text(
        strHeader,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        )
    );
  }

  SizedBox mySpace() {
    return const SizedBox(
      height: 20,
    );
  }

  Text buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container buildIcon(String filePath) {
    return Container(
      width: 50,
      height: 50,
      child: Image.asset(filePath),
    );
  }
}