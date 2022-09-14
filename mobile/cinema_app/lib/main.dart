import 'package:cinema_app/container/palinsesto.dart';
import 'package:cinema_app/container/profilo.dart';
import 'package:cinema_app/container/ricerca.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: _title, home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int index = 0;
  String _title = "Palinsesto";
  var _icon = Icons.schedule;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final pages = [
    Palinsesto(),
    Ricerca(),
    Profilo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      this.index = index;
      if (index == 0) {
        _title = "Palinsesto";
        _icon = Icons.schedule;
      } else if (index == 1) {
        _title = "Cerca";
        _icon = Icons.search;
      } else {
        _title = "Profilo";
        _icon = Icons.account_circle_outlined;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              _title,
              style: const TextStyle(
                  fontSize: 24, color: Colors.white, letterSpacing: 2),
            ),
            const SizedBox(width: 10),
            Icon(
              _icon,
              color: Colors.white,
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            thickness: 1,
            height: 0,
            color: Color.fromARGB(88, 158, 158, 158),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff001C38),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Palinsesto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cerca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profilo',
          ),
        ],
        currentIndex: this.index,
        selectedItemColor: Colors.blue,
        backgroundColor: Color(0xff002C57),
        unselectedItemColor: Colors.white60,
        onTap: _onItemTapped,
      ),
    );
  }
}
