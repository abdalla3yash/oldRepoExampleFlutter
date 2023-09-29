import 'package:flutter/material.dart';
import 'package:read/components/all_library_books.dart';
import 'package:read/data.dart';
import 'package:read/models/book_model.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<BookModel> books = new List<BookModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    books = getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: ListView.builder(
                    itemCount: books.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BooksTile(
                          imgAssetPath: books[index].imgAssetPath,
                          rating: books[index].rating,
                          title: books[index].title,
                          review_score: books[index].review_score,
                          author: books[index].author,
                          review_summary: books[index].review_summary,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
