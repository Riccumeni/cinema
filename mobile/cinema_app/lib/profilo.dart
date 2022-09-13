import 'package:flutter/material.dart';

class Profilo extends StatelessWidget {
  const Profilo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200.0, left: 30.0, right: 30),
      child: Container(
        child: Column(children: [
          const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff002C57),
              hintText: "Inserisci l'email...",
              hintStyle: TextStyle(color: Colors.white60),
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff002C57),
                hintText: "Inserisci la password...",
                hintStyle: TextStyle(color: Colors.white60),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
            ),
          ),
        ]),
      ),
    );
  }
}
