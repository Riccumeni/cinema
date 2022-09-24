import 'package:flutter/material.dart';

class Profilo extends StatelessWidget {
  const Profilo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200.0, left: 30.0, right: 30),
      child: Container(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: const SizedBox(
              width: 450,
              child: TextField(
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
            ),
          ),
          const SizedBox(
            width: 450,
            height: 100,
            child: TextField(
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
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 200,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24),
                )),
          ),
          Container(
            child: Text(
              "Hai dimenticato la password?",
              style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Oppure, registrati",
              style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline),
            ),
          )
        ]),
      ),
    );
  }
}
