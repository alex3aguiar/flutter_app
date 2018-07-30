import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Placar Ping Pong",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _teamRed = 0;
  int _teamBlue = 0;
  bool _isMatchPoint = false;
  String _gameState = "e começa o Jogo!";
  String _startMessage = "Começar";

  void _changeScoreoard(int delta, String team){
    setState(() {


      _startMessage = "Recomeçar";
      print(_isMatchPoint);
      print("mat do blue" + ( _teamBlue >= 5 && _teamRed <6 ).toString());
      print( "mat do red" + ( _teamRed >= 5 && _teamBlue <6 ).toString());

      if(team == "Blue"){
        _teamBlue++;
      }else{
        _teamRed++;
      }
      _isMatchPoint = ( _teamBlue == 6  && _teamRed <6 ) || ( _teamRed == 6 && _teamBlue <6 );
      if(_isMatchPoint){
        _gameState = "Match Point!";
      }else{
        _gameState = "Jogo Rolando";
      }

    });
  }

  void _restartGame(){
    setState(() {
      _isMatchPoint = false;
      _gameState = "e começa o Jogo!";
      _teamBlue = 0;
      _teamRed= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/fundo.png",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                    child: Text(
                      _teamRed.toString(),
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    _teamBlue.toString(),
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changeScoreoard(1,"Red");

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changeScoreoard(1,"Blue");

                    },
                  ),
                ),
              ],
            ),
            Text(
              _gameState,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: RaisedButton(
                color: Colors.deepPurple,
                child: Text(
                  _startMessage,
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
                onPressed: () {
                  _restartGame();

                },
              ),
            )

          ],
        )
      ],
    );
  }
}









