import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
 Path path =Path();
 Offset point1=Offset(size.width/4,size.height-50);
  Offset point2=Offset(size.width/2,size.height-45);
   Offset point3=Offset(size.width*(0.75),size.height-50);
    Offset point4=Offset(size.width,size.height-120);
path.lineTo(0, size.height);
path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);
path.quadraticBezierTo(point3.dx, point3.dy, point4.dx, point4.dy);
path.lineTo(size.width, 0);
path.close();
return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
   return true;
  }
  
} 