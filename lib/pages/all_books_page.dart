// ignore_for_file: unused_local_variable

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:manga_reader_app/components/all_books_horizontal_component.dart";
import "package:manga_reader_app/components/genre_clip_component.dart";
import "package:manga_reader_app/pages/manga_cover_page2.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";

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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoTextField(
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(color: Colors.white, fontFamily: "go3"),
                cursorColor:
                    Colors.amber, // Change this to your desired cursor color
                placeholder: 'Search',
                placeholderStyle: const TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(37, 36, 36, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 30,
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
                        showCupertinoModalBottomSheet(
                          expand: true,
                          context: context,
                          builder: (context) => const MangaCoverPage2(),
                        );
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
