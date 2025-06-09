import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: const Text("Riddle Quiz",style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,
    ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           _buildDifficultyButton(context,"Easy"),
           SizedBox(height: 20),
           _buildDifficultyButton(context,"Medium"),
           SizedBox(height: 20),
           _buildDifficultyButton(context,"Hard"),
         ],
       ),
     ),

    );
  }

  Widget _buildDifficultyButton(BuildContext context,String difficulty){
    return ElevatedButton(onPressed: (){
      Navigator.push(
          context, 
        MaterialPageRoute(builder: (context)=> QuizScreen(difficulty:difficulty))
      );
    },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white
        ),
        child: Text(difficulty)

    );
  }
}