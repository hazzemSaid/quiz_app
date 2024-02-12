import 'package:flutter/material.dart';
import 'Quiz.dart';

A qu = A();
void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text("quiz app"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: quiz(),
        ),
      ),
    );
  }
}

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  List<Widget> answer = [];

  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Row(
                children: answer,
              ),
              Image.asset(qu.q[ind].path),
              SizedBox(
                height: 22.0,
                width: double.infinity,
              ),
              Text(
                qu.q[ind].name,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (qu.q[ind].ans == true) {
                    answer.add(
                      Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    answer.add(
                      Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    );
                  }
                  setState(() {
                    ind++;
                    if (ind >= 4) return;
                  });
                },
                child: Text(
                  "true",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (qu.q[ind].ans == false) {
                    answer.add(
                      Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    answer.add(
                      Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    );
                  }
                  setState(() {
                    ind++;
                    if (ind >= 4) return;
                  });
                },
                child: Text(
                  "false",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
