import 'package:eslam_application/app_colors.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  String text = 'السبحة';
  int counter = 0;
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _rotation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Image.asset('assets/images/Logo.png'),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(fontSize: 36, color: AppColours.whiteColour),
          ),
          SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  counter++;
                  checkCounter();
                  _rotateSebha();
                });

              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotation.value * 3.14159 / 180,
                        child: child,
                      );
                    },
                    child: Image.asset('assets/images/Sebha.png'),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                              fontSize: 36, color: AppColours.whiteColour),
                        ),
                        Text(
                          '$counter',
                          style: TextStyle(
                              fontSize: 36, color: AppColours.whiteColour),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkCounter() {
    if (counter > 0 && counter <= 33) {
      setState(() {
        text = 'سبحان الله';
      });
    } else if (counter > 33 && counter <= 66) {
      setState(() {
        text = 'الحمدلله';
      });
    } else if (counter > 66 && counter <= 99) {
      setState(() {
        text = 'الله اكبر';
      });
    } else {
      setState(() {
        counter = 0;
        text = '';
      });
    }
  }

  void _rotateSebha() {

    _rotation = Tween<double>(begin: _rotation.value, end: _rotation.value + 5.0).animate(_controller);
    _controller.forward(from: 0.0);
  }
}

