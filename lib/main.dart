import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Booksy(),
      title: "Booksy",
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent)),
    ),
  );
}

class UserData extends InheritedWidget {
  final List<String> booksIds; //["123","asdas","Douglas-Hitch"]
  const UserData({Key? key, required this.booksIds, required Widget child})
      : super(key: key, child: child);

  static UserData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserData>()!;
  }

  @override
  bool updateShouldNotify(covariant UserData oldWidget) {
    // TODO: implement updateShouldNotify
    return booksIds != oldWidget.booksIds;
    //return true;
  }
}

class UserDataContainerWidget extends StatefulWidget {
  UserDataContainerWidget({required this.child});

  final Widget child;

  @override
  UserDataContainerState createState() {
    return UserDataContainerState();
  }
}

class UserDataContainerState extends State<UserDataContainerWidget> {
  List<String> localBooksId = [];

  static UserDataContainerState of(BuildContext context) {
    return context.findAncestorStateOfType<UserDataContainerState>()!;
  }

  @override
  Widget build(BuildContext context) {
    return UserData(booksIds: List.from(localBooksId), child: widget.child);
  }

  void addToLibrary(String bookId) {
    setState(() {
      localBooksId.add(bookId);
    });
  }
  
  void removeToLibrary(String bookId) {
    setState(() {
      localBooksId.remove(bookId);
    });
  }
}

class Booksy extends StatelessWidget {
  const Booksy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: UserDataContainerWidget(
        child: BookScreen(),
      ),
    );
  }
}

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(boxShadow: [BoxShadow(blurRadius: 8)]),
                  child: Image(
                    image: AssetImage('images/book.jpg'),
                    width: 200,
                  ),
                ),
                BookDescription(
                    "The Hitchhiker's Guide to the Galaxy",
                    "Douglas Adams",
                    "It’s an ordinary Thursday morning for Arthur Dent . . . until his house gets demolished. The Earth follows shortly after to make way for a new hyperspace express route, and Arthur’s best friend has just announced that he’s an alien."),
                Padding(padding: EdgeInsets.only(bottom: 80)),
                AddBookButton("Douglas-Hitch"),
              ],
            ),
          ),
        ),
      ),
      color: Colors.white,
    );
  }
}

class AddBookButton extends StatelessWidget {
  final String bookId;

  AddBookButton(this.bookId);

  @override
  Widget build(BuildContext context) {
    var userData = UserData.of(context);
    var isSaved = userData.booksIds.contains(bookId);

    var button = isSaved
        ? ElevatedButton(
            onPressed: () {
              _removeBooInkLibrary(context);
            },
            child: Text("Quitar de la Libreria"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          )
        : ElevatedButton(
            onPressed: () {
              _addBookInLibrary(context);
            },
            child: Text("Agregar a Libreria"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          );

    return Directionality(textDirection: TextDirection.ltr, child: button);
  }

  void _addBookInLibrary(BuildContext context) {
    var userDataContainerState = UserDataContainerState.of(context);
    userDataContainerState.addToLibrary(bookId);
  }
  void _removeBooInkLibrary(BuildContext context) {
    var userDataContainerState = UserDataContainerState.of(context);
    userDataContainerState.removeToLibrary(bookId);
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
