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
            BookDescription(
              "The Hitchhiker's Guide to the Galaxy",
              "Douglas Adams",
              "It’s an ordinary Thursday morning for Arthur Dent . . . until his house gets demolished. The Earth follows shortly after to make way for a new hyperspace express route, and Arthur’s best friend has just announced that he’s an alien."
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

class BookDescription extends StatelessWidget {
  final String tittle;
  final String author;
  final String description;

  const BookDescription(this.tittle, this.author, this.description);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 40)),
        Text(
          tittle,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black87, fontSize: 30),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        Text(
          author,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          description,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
      ],
    );
  }
}
