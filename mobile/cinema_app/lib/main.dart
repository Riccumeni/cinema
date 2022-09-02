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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final pages = [
    Container(
      margin: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Palinsesto', style: TextStyle(fontSize: 24, color: Colors.white),),
              SizedBox(width: 10),
              Icon(Icons.schedule, color: Colors.white,)
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                Image(
                  image: NetworkImage('https://mr.comingsoon.it/imgdb/locandine/big/50817.jpg'),
                  height: 500,
                  width: 300,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: NetworkImage('https://mr.comingsoon.it/imgdb/locandine/big/50817.jpg'),
                  height: 500,
                  width: 300,
                  fit: BoxFit.fill
                ),
                Image(
                  image: NetworkImage('https://mr.comingsoon.it/imgdb/locandine/big/50817.jpg'),
                  height: 500,
                  width: 300,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          )
        ],
      ),
    ),
    const Center(
      child: Text('cerca'),
    ),
    const Center(
      child: Text('profilo'),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001C38),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'School',
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
