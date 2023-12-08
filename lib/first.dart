import 'package:flutter/material.dart';
import 'package:timerapp/second.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({
    super.key
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Container(
          color: Colors.black,
          child: Column(
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
                      color: Color.fromRGBO(156, 156, 155, 1),
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
              SizedBox(height: 10,),
               Text(
                        'Time to eat mindfully',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "It's simple : eat slowly for ten minutes,rest for ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "five, then finish your meal ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 80,),

                     Container(
  width: 300.0,
  height: 300.0,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Color(0xfff24FFCC),
      width: 20.0,
    ),
  ),
  child: Center(
    child: Text(
                          "30",
                          style: TextStyle(
                            color: Color(0xfff24FFCC),
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
  ),
),
SizedBox(height: 50,),
Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(248, 248, 247, 1),
                  ),
                  child: Center(
                    child: InkWell(
                      child: Text(
                        'START',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TimerReel()),
                          );
                        
                      },
                    ),
                  ),
                ),

            ],
          ),
    
        ),
    );
    

    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Mindful Meal timer',
        style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),),
        centerTitle: true,
       
        ),
      body: content,
    );
  }
}