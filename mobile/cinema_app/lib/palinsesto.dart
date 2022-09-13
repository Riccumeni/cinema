import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_app/request.dart';

class Palinsesto extends StatelessWidget {
  const Palinsesto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Request req = new Request();
    final images = [
      'https://mr.comingsoon.it/imgdb/locandine/big/50817.jpg',
      'https://pad.mymovies.it/filmclub/2016/09/021/locandina.jpg'
    ];

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
                        'Palinsesto',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.schedule,
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
            Expanded(
              child: FutureBuilder(
                future: req.get(url: 'http://localhost:3000/api/palinsesto'),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    var spettacoli = snapshot.data;
                    return ListWheelScrollView(
                        physics: const FixedExtentScrollPhysics(),
                        itemExtent: 500,
                        children: [
                          for (var element in spettacoli!)
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Image(
                                image: NetworkImage(
                                    'http://localhost:3000/img/${element.locandina}'),
                                height: 500,
                                width: 300,
                                fit: BoxFit.fill,
                              ),
                            )
                        ]);
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            // child: ListWheelScrollView(
            //     physics: const FixedExtentScrollPhysics(),
            //     itemExtent: 500,
            //     children: [
            //       for (var element in images)
            //         Container(
            //           padding: EdgeInsets.only(right: 20),
            //           child: Image(
            //             image: NetworkImage(element),
            //             height: 500,
            //             width: 300,
            //             fit: BoxFit.fill,
            //           ),
            //         )
            //     ]),
          ],
        ));
  }
}
