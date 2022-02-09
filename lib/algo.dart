import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Button();
  }
}

class _Button extends State<Button> {
  int turn_no = 0;
  List ele_no = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index){
          return GestureDetector(
            onTap: () {
              _click(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange)),
              child: Center(
                child: Text(
                  ele_no[index],
                  style: TextStyle(color: Colors.orange, fontSize: 150),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void re_play() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        ele_no[i] = '';
        turn_no = 0;
      }
    });
  }

  void Winner_disp(String winner) {
    var alertDialog = AlertDialog(
      title: Text("$winner WINS"),
      actions: [
        RaisedButton(
          color: Colors.red,
          child: Text("Play Again",
              style: TextStyle(fontSize: 20.0, color: Colors.black)),
          elevation: 6.0,
          onPressed: () {
            re_play();
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  void _click(int index) {
    setState(() {
      if (turn_no % 2 == 0 && ele_no[index] == '') {
        ele_no[index] = 'x';
        turn_no += 1;
      } else if (turn_no % 2 != 0 && ele_no[index] == '') {
        ele_no[index] = 'o';
        turn_no += 1;
      }
      win_call();
    });
  }

  void game_draw() {
    var drawDialog = AlertDialog(
      title: Text("Game Draw"),
      actions: [
        RaisedButton(
          color: Colors.red,
          child: Text("Play Again",
              style: TextStyle(fontSize: 20.0, color: Colors.black)),
          elevation: 6.0,
          onPressed: () {
            re_play();
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return drawDialog;
        });
  }

  void win_call() {
    if (ele_no[0] == ele_no[1] && ele_no[0] == ele_no[2] && ele_no[0] != '') {
      Winner_disp(ele_no[0]);
    }
    if (ele_no[3] == ele_no[4] && ele_no[3] == ele_no[5] && ele_no[3] != '') {
      Winner_disp(ele_no[3]);
    }
    if (ele_no[6] == ele_no[7] && ele_no[6] == ele_no[8] && ele_no[6] != '') {
      Winner_disp(ele_no[6]);
    }
    if (ele_no[0] == ele_no[3] && ele_no[0] == ele_no[6] && ele_no[0] != '') {
      Winner_disp(ele_no[0]);
    }
    if (ele_no[1] == ele_no[4] && ele_no[1] == ele_no[7] && ele_no[1] != '') {
      Winner_disp(ele_no[1]);
    }
    if (ele_no[2] == ele_no[5] && ele_no[2] == ele_no[8] && ele_no[2] != '') {
      Winner_disp(ele_no[2]);
    }
    if (ele_no[0] == ele_no[4] && ele_no[0] == ele_no[8] && ele_no[0] != '') {
      Winner_disp(ele_no[0]);
    }
    if (ele_no[2] == ele_no[4] && ele_no[2] == ele_no[6] && ele_no[2] != '') {
      Winner_disp(ele_no[2]);
    }
    else if (turn_no == 9) {
      game_draw();
    }
  }
}
