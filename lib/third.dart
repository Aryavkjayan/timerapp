import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:audioplayers/audioplayers.dart';

class Timerthree extends StatefulWidget {
  const Timerthree({Key? key}) : super(key: key);

  @override
  _TimerthreeState createState() => _TimerthreeState();
}

class _TimerthreeState extends State<Timerthree> {
  late Timer _timer;
  int _start = 30;
  var _isTimerOn = false;

  AudioPlayer audioPlayer = AudioPlayer();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _isTimerOn = false; // Update the timer state when it reaches 0.
          });
        } else if (_start == 5) {
          playAlert(); // Play audio when the timer reaches 5 seconds.
          setState(() {
            _start--;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void playAlert() async {
    await audioPlayer.play('audio/countdown_tick.mp3' as Source,);
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer automatically when the widget is inserted into the tree.
    _isTimerOn = true; // Update the timer state.
  }

  @override
  void dispose() {
    _timer.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'Mindful Meal timer',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xfff2B2B2B),
      ),
      body: Container(
        color: Color(0xfff2B2B2B),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(children: [
                SizedBox(width: 155,),
                Container(
                  width: 15,
                  height: 15,
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(156, 156, 155, 1),
                    ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 15,
                  height: 15,
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 15,
                  height: 15,
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(156, 156, 155, 1),
                    ),
                ),
              ],),
              SizedBox(height:2,),
               Text(
                        'Break Time',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Take a five-minutes break to check in on your",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Level of fullness ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.85,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: MediaQuery.of(context).size.width * 0.84,
                  customColors: CustomSliderColors(
                    trackColor: Color(0xfff364643),
                    progressBarColor: Color(0xfff24FFCC),
                    dotColor: Colors.black,
                    shadowColor: Colors.grey.shade600,
                  ),
                  startAngle: 270,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 36,
                    progressBarWidth: 22,
                    handlerSize: 7,
                  ),
                ),
                min: 0,
                max: 30,
                initialValue: _start.toDouble(),
                onChange: (double value) {
                  setState(() {
                    _start = value.round();
                  });
                },
                innerWidget: (percentage) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_start.round()}',
                        style: const TextStyle(
                          fontSize: 120,
                          color: Color(0xfff24FFCC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "seconds remaining",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_isTimerOn) {
                    _timer.cancel();
                    _isTimerOn = false;
                  } else {
                    _isTimerOn = true;
                    startTimer();
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                    color: _isTimerOn ? Colors.white : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(2, 4),
                      ),
                    ]),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  _isTimerOn ? 'Pause' : 'Resume',
                  style: TextStyle(
                    fontSize: 24,
                    color: _isTimerOn ? Colors.black : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
           Container(
  alignment: Alignment.center,
  width: MediaQuery.of(context).size.width * 0.65,
  decoration: BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.white, // Set the border color to white
      width: 2.0, // Set the border width
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(2, 4),
      ),
    ],
  ),
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Text(
    "LET'S STOP I'AM FULL NOW",
    style: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}