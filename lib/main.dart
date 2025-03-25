import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Check_math());
}

class Check_math extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      First_page(),
    );
  }
}
class First_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _First_page();
  }
}
class _First_page extends State<First_page>{
  var color_easy = Colors.green;
  var color_medium = Colors.grey;
  var color_hard = Colors.grey;
  var plus = true;
  var minus = false;
  var multiplus = false;
  var devide = false;
  var colors_list = [Colors.green,Colors.grey,Colors.grey,Colors.grey];
  var text_error = "";
  String get_lvl(){
    if(color_easy == Colors.green){
      return "easy";
    }
    else if(color_medium == Colors.green){
      return "medium";
    }
    else if(color_medium == Colors.green){
      return "hard";
    }
    return "";
  }

  void start(){
    if(plus == false && minus == false && multiplus == false && devide == false){
      setState(() {
        text_error = "add min one math symbol";
        });
    }
     else{
      Navigator.push(context, MaterialPageRoute(builder:(context)
      => Main_screen(
        plus: plus,
        minus: minus,
        multiplus: multiplus,
        devide: devide,
        name_lvl: get_lvl()
      )));
     } 
  
  }

  void change_math_symbols(int index){
    setState(() {
    if(colors_list[index] == Colors.green){
      colors_list[index] = Colors.grey;
    }
    else{
      colors_list[index] = Colors.green;
    }
    if(index == 0){
      plus = !plus;// ! - отрицание
    }  
    else if(index == 1){
      minus = !minus;
    }
    else if(index == 2){
      multiplus = !multiplus; 
    }
    else if(index == 3){
      devide = !devide;
    }
    text_error = "";
    });
  }
  void change_lvl(String name_lvl){
    setState(() {
    if(name_lvl == "easy"){
      color_easy = Colors.green;
      color_medium = Colors.grey;
      color_hard = Colors.grey;
    }
    else if(name_lvl == "medium"){
      color_easy = Colors.grey;
      color_medium = Colors.green;
      color_hard = Colors.grey;
    }
    else if(name_lvl == "hard"){
      color_easy = Colors.grey;
      color_medium = Colors.grey;
      color_hard = Colors.green;
  }  
    }); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check math"),),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        ElevatedButton(onPressed: ()=>change_math_symbols(0), 
        child: Text("+",style: TextStyle(
          fontSize: 25 ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors_list[0] )
        ),
        ElevatedButton(onPressed: ()=>change_math_symbols(1), 
        child: Text("-",style: TextStyle(
          fontSize: 25
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:colors_list[1] )
        ),
        ElevatedButton(onPressed: ()=>change_math_symbols(2), 
        child: Text("*",
        style: TextStyle( 
          fontSize: 25 
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors_list[2] )
        ),
        ElevatedButton(onPressed: ()=>change_math_symbols(3), 
        child: Text("/",style: TextStyle(
          fontSize: 25
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors_list[3] )
        ), 
        ],),
        Row(children: [ElevatedButton(onPressed: ()=> change_lvl("easy"), child: Text("easy",style: TextStyle(fontSize: 25,color: color_easy),))],
        mainAxisAlignment: MainAxisAlignment.center,),
         Row(children: [ElevatedButton(onPressed: ()=> change_lvl("medium"), child: Text("medium",style: TextStyle(fontSize: 25,color: color_medium),))],
        mainAxisAlignment: MainAxisAlignment.center,),
         Row(children: [ElevatedButton(onPressed: ()=> change_lvl("hard"), child: Text("hard",style: TextStyle(fontSize: 25,color: color_hard),))],
        mainAxisAlignment: MainAxisAlignment.center,),
         Row(children: [ElevatedButton(onPressed: start, child: Text("start",style: TextStyle(fontSize: 35,color: Colors.black),))],
        mainAxisAlignment: MainAxisAlignment.center,),
        Row(children: [Text("$text_error",style: TextStyle(fontSize: 20,color:Colors.red),)],
        mainAxisAlignment: MainAxisAlignment.center,)
      ],
    )
    ); 
    
  }
}
class Main_screen extends StatefulWidget{
  bool plus;
  bool minus;
  bool multiplus;
  bool devide;
  String name_lvl;
 
  @override
  State<StatefulWidget> createState() {
    return _Main_screen(plus,minus,multiplus,devide,name_lvl);
  }
  Main_screen({required this.plus,required this.minus,required this.multiplus,required this.devide,required this.name_lvl});
  
}


class _Main_screen extends State<Main_screen>{
  late Timer timer_question;
  int seconds = 0;
  static const String text_ans = "your answear";
  String user_answear = text_ans;
  var number1 = Random().nextInt(500);
  var number2 = Random().nextInt(500);
  var bg_color = Colors.black;
  var symbol = "+";
  var max_pluse = 500;
  var max_minuse = 1000;
  var max_multeplse = 15;
  var max_divide = 400;
  var colors_list = [Colors.green,Colors.grey,Colors.grey,Colors.grey];
  var symbols = ["+","-","*","/"];

  _Main_screen(bool plus,bool minus,bool multiplus,bool devide,String name_lvl){
    if(name_lvl == "easy"){
      seconds = 25;
    }
    else if(name_lvl == "medium"){
      seconds = 20;
    }
    else if(name_lvl == "hard"){
      seconds = 15;
    }
    if(plus == true){
      colors_list[0] = Colors.green;
    }
    else{
      colors_list[0] = Colors.grey;
    }
    if(minus == true){
      colors_list[1] = Colors.green;
    }
    else{
      colors_list[1] = Colors.grey;
    }
    if(multiplus == true){
      colors_list[2] = Colors.green;
    }
    else{
      colors_list[2] = Colors.grey;
    }
    if(devide == true){
      colors_list[3] = Colors.green;
    }
    else{
      colors_list[3] = Colors.grey;
    }
  }
  @override
  void initState() {
    super.initState();// super - обращение к родителю
    start_timer();
  }
  
  void start_timer(){
    timer_question = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        seconds++;
      });
    });
  }

void stop_timer(){
  timer_question.cancel();
}

void next_question(){
  var max_number = 0;
  setState(() {
    symbol = symbols[Random().nextInt(4)];// генерирование случайного знака
    colors_list = [Colors.grey,Colors.grey,Colors.grey,Colors.grey];
  if(symbol == "+"){
    max_number = max_pluse;
    colors_list[0] = Colors.green;
  }
  else if( symbol == "-"){
    max_number = max_minuse;
    colors_list[1] = Colors.green;
  }
  else if( symbol == "*"){
    max_number = max_multeplse;
    colors_list[2] = Colors.green;
  }
  else if( symbol == "/"){
    max_number = max_divide;
    colors_list[3] = Colors.green;
  }
  
    number1 = Random().nextInt(max_number);
    number2 = Random().nextInt(max_number);
    user_answear = "";
    if(symbol == "-"){
      int number3 = 0;
      if(number2 > number1){
        number3 = number1;
        number1 = number2;
        number2 = number3;
      }

    }
    // дз делать тут
  });

}
void check_result(){
  var corecte_answear = 0;
  if(symbol == "+"){
    corecte_answear = number1 + number2;
  }
  else if (symbol == "-"){
    corecte_answear = number1 - number2;
  }
  else if (symbol == "*"){
    corecte_answear = number1 * number2;
  }
  else if (symbol == "/"){
    corecte_answear = (number1 / number2).floor();// floor() - уберает дробную часть приобразую к типу данных инт
  }

  if( corecte_answear == int.parse(user_answear)){
    setState(() {
    bg_color = Colors.green;  
    });
    
    Future.delayed(Duration(seconds: 1),// delayed - задержка Duration промижуток времени 
    (){
      setState(() {
      bg_color = Colors.black;  
        next_question();
        seconds = 0;
      });
  });
  }
}

  void click_number(int number ){
    setState(() {
      if(user_answear == text_ans){
    user_answear = number.toString();
  }
  else{
    user_answear = user_answear + number.toString();
  }    
    }); 
    check_result();
  }

  void delete_last(){
    setState(() {
      if(user_answear == text_ans){
        user_answear = "";
      }
      else if(user_answear.length == 0){
        return;
      }
      else{
        user_answear = user_answear.substring(0,user_answear.length -1);
      }
    });
    check_result();
  }
  void change_plus_mines(){
    setState(() {
        if(user_answear == text_ans || user_answear.length == 0){
      user_answear = "-";
    }
    else if(user_answear[0] == "-"){
      user_answear = user_answear.substring(1,user_answear.length);
    }
    else{
      user_answear = "-$user_answear";
    }
    });
    check_result();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("math test"),) ,
      body:Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        ElevatedButton(onPressed: (){}, 
        child: Text("+",style: TextStyle(
          fontSize: 25 ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors_list[0] )
        ),
        ElevatedButton(onPressed: (){}, 
        child: Text("-",style: TextStyle(
          fontSize: 25
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:colors_list[1] )
        ),
        ElevatedButton(onPressed: (){}, 
        child: Text("*",
        style: TextStyle( 
          fontSize: 25 
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors_list[2] )
        ),
        ElevatedButton(onPressed: (){}, 
        child: Text("/",style: TextStyle(
          fontSize: 25
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors_list[3] )
        ),
      ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,    
        children: [
        Text("$seconds",
        style: TextStyle(fontSize: 30,color: Colors.black),)
        
      ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,       
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical:50,
              horizontal: 80 ),
            child: Text(
              "$number1 $symbol $number2",
              style: TextStyle(
                color:Colors.yellow,
                fontSize: 35
              ),
              ),
            decoration: BoxDecoration(
              color: bg_color,
              borderRadius: BorderRadius.circular(15)
            ) ,     
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user_answear,style: TextStyle(fontSize: 35),)
        ],
      ),
      Column(
        
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:() => click_number(1), child: Text("1",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:() =>click_number(2), child: Text("2",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:() => click_number(3), child: Text("3",style: TextStyle(fontSize: 25),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:() => click_number(4), child: Text("4",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:() => click_number(5), child: Text("5",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:() => click_number(6), child: Text("6",style: TextStyle(fontSize: 25),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:() => click_number(7), child: Text("7",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:() => click_number(8), child: Text("8",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:() => click_number(9), child: Text("9",style: TextStyle(fontSize: 25),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:() => click_number(0), child: Text("0",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed:change_plus_mines, child: Text("+/-",style: TextStyle(fontSize: 25),)),
              ElevatedButton(onPressed: delete_last, child: Text("X",style: TextStyle(fontSize: 25),)),
            ],
          )
          
          
        ],
      )
      ],
    ) ,
    );
    
  }
}