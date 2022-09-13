import 'package:flutter/material.dart';

class Profilo extends StatelessWidget {
  const Profilo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Profilo',
                      style: TextStyle(
                          fontSize: 24, color: Colors.white, letterSpacing: 2),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: const [
                TextField(
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
                TextField(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
