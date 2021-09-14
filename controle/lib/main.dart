import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController firstcontroller = TextEditingController();
  TextEditingController secuntcontroller = TextEditingController();
  TextEditingController operationcontroller = TextEditingController();
  double _calcular= 0;


  void _reset(){
    firstcontroller.text= "";
    secuntcontroller.text= "";
    operationcontroller.text="";
    setState(() {
       _calcular= 0;
    });
  }
void calculo(){
  setState(() {
    double first = double.parse(firstcontroller.text);
    double secunt = double.parse(secuntcontroller.text);
    String operation = operationcontroller.text;

    if (operation=="/"){
      _calcular = first/secunt;
    }else if(operation == "+" ){
      _calcular = first+secunt;
    }else if (operation== "-" ){
      _calcular= first- secunt;
    }else if (operation== "*"){
      _calcular= first*secunt;
    }else{
      _calcular= 0;
    }

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("calculo"),
          centerTitle: true,
          actions: [IconButton(onPressed: _reset, icon: Icon(Icons.refresh))],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "val1",
                        labelStyle:
                            TextStyle(color: Colors.blue, fontSize: 20)),
                    style: new TextStyle(
                        fontSize: 10.0, height: 2.0, color: Colors.black),
                    controller: firstcontroller,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "operação:",
                  style: TextStyle(color: Colors.blue),
                ),
                Container(
                  width: 50.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: " ",
                        labelStyle:
                            TextStyle(color: Colors.blue, fontSize: 20)),
                    style: new TextStyle(
                        fontSize: 10.0, height: 2.0, color: Colors.black),
                    controller: operationcontroller,
                  ),
                ),
                Container(
                  width: 500.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "val2",
                        labelStyle:
                            TextStyle(color: Colors.blue, fontSize: 20)),
                    style: new TextStyle(
                        fontSize: 10.0, height: 2.0, color: Colors.black),
                    controller: secuntcontroller,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Image.network(
                    "http://4.bp.blogspot.com/_tfjeykz8M_k/Sh3rDG_wsxI/AAAAAAAADAo/swwMxK0dgOU/s640/homer_simpson_pensando.jpg"),
            SizedBox(
              height: 20,),
                Text( "o resultado é $_calcular", style: TextStyle(color: Colors.blue),),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 1000,
                  height: 40,
                  child:
                      ElevatedButton(onPressed: calculo, child: Text("calcular")),
                )
              ],
            ),
          ),
        ));
  }
}
