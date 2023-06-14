import 'package:flutter/material.dart';

void main() {
  runApp(const Booksy());
}

class Booksy extends StatelessWidget {
  const Booksy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Container(
              decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 8)]),
              child: Image(
                image: AssetImage('images/book.jpg'),
                width: 200,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text(
              "The Hitchhiker's Guide to the Galaxy",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 30),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text(
              "Douglas Adams",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black54, fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "It’s an ordinary Thursday morning for Arthur Dent . . . until his house gets demolished. The Earth follows shortly after to make way for a new hyperspace express route, and Arthur’s best friend has just announced that he’s an alien.",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            Padding(padding: EdgeInsets.only(bottom: 200)),
            Directionality(
                textDirection: TextDirection.ltr,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Agregar a Libreria"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                ))
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}
