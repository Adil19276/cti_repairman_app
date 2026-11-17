import 'dart:async';
import 'package:cti_repairman_app/sign_up.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin{
    late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.5), 
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => sign_up()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFFFB74D), Color(0xFFE0E0E0)],
          ),
        ),
        child: Center(
          child: SlideTransition(
            position: _animation,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.70,
              height: MediaQuery.sizeOf(context).height * 0.60,
              child: Image.asset(
                'assets/click_to_integrate.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),);
  }
}