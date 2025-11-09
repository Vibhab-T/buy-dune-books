import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.all(35),
            child: Image.asset("lib/images/dunedune.png", height: 250),
          ),

          //title
          Text(
            "Fear is the mind-killer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),

          //subtitle
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Fear is the little-death that brings total obliteration. I will face my fear. I will permit it to pass over me and through me. And when it has gone past, I will turn the innter eye to see its path. Where the fear has gone...",
              style: TextStyle(fontSize: 9, color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 100),

          //goIn
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/homepage");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.all(25),
                child: Center(
                  child: Text(
                    "Only I will remain.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
