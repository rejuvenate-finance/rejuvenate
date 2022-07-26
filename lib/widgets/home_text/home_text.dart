import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeText extends StatefulWidget {
  const HomeText({Key? key, required this.head, required this.sub})
      : super(key: key);
  final String head;
  final String sub;

  @override
  State<HomeText> createState() => _HomeTextState();
}

class _HomeTextState extends State<HomeText> {
  bool isAnimate = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isAnimate = true;
        });
      },
      onExit: (_) {
        setState(() {
          isAnimate = false;
        });
      },
      child: Container(
        width: 450.0,
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 25.0,
        ),
        child: Column(
          children: [
            Container(
              height: 3.0,
              width: 200,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10.0,
            ),
            AnimatedCrossFade(
              firstChild: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  widget.head,
                  style: GoogleFonts.poppins(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              secondChild: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  widget.head,
                  style: GoogleFonts.poppins(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              crossFadeState: !isAnimate
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
              ),
              child: Text(
                widget.sub,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 200.0,
                top: 15.0,
              ),
              height: 3.0,
              width: 200,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 150.0,
                top: 10.0,
              ),
              height: 3.0,
              width: 200,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
