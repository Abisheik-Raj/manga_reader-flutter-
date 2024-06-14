// ignore_for_file: unused_local_variable

import "package:flutter/material.dart";
import "package:manga_reader_app/components/all_books_horizontal_component.dart";
import "package:manga_reader_app/components/genre_clip_component.dart";
import "package:manga_reader_app/pages/manga_cover_page.dart";

class AllBooksPage extends StatelessWidget {
  const AllBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "ALL BOOKS",
            style:
                TextStyle(color: Colors.white, fontFamily: "go3", fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GenreClipComponent(
                        text: "Mystery",
                        clicked: true,
                      ),
                      GenreClipComponent(
                        text: "Thriller",
                        clicked: false,
                      ),
                      GenreClipComponent(
                        text: "Drama",
                        clicked: false,
                      ),
                      GenreClipComponent(
                        text: "Love",
                        clicked: false,
                      ),
                      GenreClipComponent(
                        text: "Goul",
                        clicked: false,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "83 books",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PoppinsRegular",
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MangaCoverPage(),
                            ));
                      },
                      child: const AllBooksHorizontalComponent(),
                    ),
                    const AllBooksHorizontalComponent(),
                    const AllBooksHorizontalComponent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
