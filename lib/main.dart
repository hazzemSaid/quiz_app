import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  int ind = 0, correct = 0;
  AlertType fun(int x, int a) {
    if (x > a / 2) return AlertType.success;
    return AlertType.error;
  }

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
                  color: const Color.fromARGB(255, 202, 141, 141),
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
                    correct++;
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
                    if (ind >= qu.q.length) {
                      Alert(
                        context: context,
                        type: fun(correct, ind),
                        title: "the end of Quitions",
                        desc: "$correct / " + "$ind",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "again",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                      ind = 0;
                      correct = 0;
                      answer.clear();
                    }
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
                    correct++;
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
                    if (ind >= qu.q.length) {
                      Alert(
                        context: context,
                        type: fun(correct, ind),
                        title: "the end of Quitions",
                        desc: "$correct / " + "$ind",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "again",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                      ind = 0;
                      correct = 0;
                      answer.clear();
                    }
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
