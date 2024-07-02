// ignore_for_file: unused_local_variable

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:manga_reader_app/components/all_books_horizontal_component.dart";
import "package:manga_reader_app/components/genre_clip_component.dart";
import "package:manga_reader_app/components/shimmer_box.dart";
import "package:manga_reader_app/modals/recent_book_modal.dart";
import "package:manga_reader_app/pages/manga_cover_page.dart";
import "package:mangadex_library/mangadex_client.dart";
import "package:mangadex_library/mangadex_library.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";
import "package:provider/provider.dart";

class AllBooksPage extends StatefulWidget {
  const AllBooksPage({super.key});

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  bool safeClicked = true;
  bool suggestiveClicked = false;
  bool shounenClicked = false;
  bool seinenClicked = false;
  bool shoujoClicked = false;
  bool joseiClicked = false;

  bool isLoading = true;

  // late List<bool> clickedContentRating = [];

  final TextEditingController searchController = TextEditingController();
  String clientId =
      "personal-client-a6a5fe43-df61-48a9-9084-11d7379a8ced-6bcb7bb9";
  String clientSecret = "zbwHSvb3jCwetCVXYzNswdldsCjlJh9T";

  String username = "AbisheikRaj";
  String password = "ItsChennai@2313";

  ScrollController scrollController = ScrollController();

  late MangadexPersonalClient client;
  late List<SearchData> books = [];
  late List<Map<String, String>> booksMap = [];

  @override
  void initState() {
    super.initState();
    client =
        MangadexPersonalClient(clientId: clientId, clientSecret: clientSecret);
    login();
    getBooksByRating();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void getBooksByName(String name) async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });
    Search searchData = await client.search(query: name);
    books = searchData.data!;
    booksMap = [];
    for (int i = 0; i < books.length; i++) {
      String mangaID = books[i].id.toString();
      String imageUrl = await getMangaCoverArtUrl(mangaID);

      booksMap.insert(i, {
        "id": mangaID,
        "title": books[i].attributes!.title!.en.toString(),
        "contentRating": books[i].attributes!.contentRating.toString(),
        "publicDemographic":
            books[i].attributes!.publicationDemographic.toString(),
        "description": books[i].attributes!.description!.en.toString(),
        "imageUrl": imageUrl,
      });
    }

    scrollToTop();

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void getBooksByRating() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });
    List<ContentRating> rating = [
      if (safeClicked) ContentRating.safe,
      if (suggestiveClicked) ContentRating.suggestive,
    ];

    List<PublicDemographic> publicDemographic = [
      if (shounenClicked) PublicDemographic.shounen,
      if (seinenClicked) PublicDemographic.seinen,
      if (shoujoClicked) PublicDemographic.shoujo,
      if (joseiClicked) PublicDemographic.josei,
    ];

    Search searchData = await client.search(
        contentRating: rating, publicationDemographic: publicDemographic);
    books = searchData.data!;
    booksMap = [];

    for (int i = 0; i < books.length; i++) {
      String mangaID = books[i].id.toString();
      String imageUrl = await getMangaCoverArtUrl(mangaID);

      booksMap.insert(i, {
        "id": mangaID,
        "title": books[i].attributes!.title!.en.toString(),
        "contentRating": books[i].attributes!.contentRating.toString(),
        "publicDemographic":
            books[i].attributes!.publicationDemographic.toString(),
        "description": books[i].attributes!.description!.en.toString(),
        "imageUrl": imageUrl,
      });
    }

    scrollToTop();

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  void login() async {
    try {
      await client.login(username, password);
      debugPrint("Logged in Successfully");
    } catch (e) {
      debugPrint("Error occured : ${e.toString()}");
    }
  }

  Future<String> getMangaCoverArtUrl(String mangaID) async {
    Cover coverArtUrl = await client.getCoverArt([mangaID]);

    return "https://uploads.mangadex.org/covers/$mangaID/${coverArtUrl.data![0].attributes!.fileName}";
  }

  void scrollToTop() {
    if (mounted) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    RecentBookModal recentBook =
        Provider.of<RecentBookModal>(context, listen: true);

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
                    GestureDetector(
                      onTap: () {
                        safeClicked = !safeClicked;

                        getBooksByRating();
                      },
                      child: GenreClipComponent(
                        text: "Safe",
                        clicked: safeClicked,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        suggestiveClicked = !suggestiveClicked;
                        getBooksByRating();
                      },
                      child: GenreClipComponent(
                        text: "Suggestive",
                        clicked: suggestiveClicked,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        shounenClicked = !shounenClicked;
                        getBooksByRating();
                      },
                      child: GenreClipComponent(
                        text: "Shounen",
                        clicked: shounenClicked,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        seinenClicked = !seinenClicked;
                        getBooksByRating();
                      },
                      child: GenreClipComponent(
                        text: "Senin",
                        clicked: seinenClicked,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        shoujoClicked = !shoujoClicked;
                        getBooksByRating();
                      },
                      child: GenreClipComponent(
                        text: "Shoujo",
                        clicked: shoujoClicked,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        joseiClicked = !joseiClicked;
                        getBooksByRating();
                      },
                      child: GenreClipComponent(
                        text: "Josei",
                        clicked: joseiClicked,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoTextField(
                controller: searchController,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(color: Colors.white, fontFamily: "go3"),
                cursorColor: Colors.amber,
                placeholder: 'Search',
                placeholderStyle: const TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(37, 36, 36, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                onSubmitted: (value) async {
                  getBooksByName(value);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "${booksMap.length} books",
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "PoppinsRegular",
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              isLoading == true
                  ? Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const ShimmerBox();
                          }),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: booksMap.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            RecentBookModal recentBookModalProvider =
                                Provider.of<RecentBookModal>(context,
                                    listen: true);

                            List recents =
                                recentBookModalProvider.recents ?? [];
                            int selectedChapter = 1;
                            if (recents.isNotEmpty) {
                              for (int i = 0; i < recents.length; i++) {
                                if (recents[i]["id"] == booksMap[index]["id"]) {
                                  selectedChapter =
                                      recents[i]["currentChapter"];
                                  break;
                                }
                              }
                            }

                            return GestureDetector(
                              onTap: () {
                                showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return MangaCoverPage(
                                        data: booksMap[index],
                                        selectedChapter: selectedChapter,
                                        recents: recentBook.recents,
                                      );
                                    });
                              },
                              child: AllBooksHorizontalComponent(
                                imageUrl: booksMap[index]["imageUrl"]!,
                                title: booksMap[index]["title"]!,
                                contentRating: booksMap[index]
                                    ["contentRating"]!,
                                publicDemographic: booksMap[index]
                                                ["publicDemographic"]!
                                            .toString() ==
                                        "null"
                                    ? ""
                                    : booksMap[index]["publicDemographic"]!
                                        .toString(),
                                description: booksMap[index]["description"]!,
                              ),
                            );

                            // return FutureBuilder(
                            //     future: getMangaCoverArtUrl(mangaID),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData) {
                            //         return AllBooksHorizontalComponent(
                            //           imageUrl: snapshot.data!,
                            //           title: books[index]
                            //               .attributes!
                            //               .title!
                            //               .en
                            //               .toString(),
                            //           contentRating: books[index]
                            //               .attributes!
                            //               .contentRating
                            //               .toString(),
                            //           description: books[index]
                            //               .attributes!
                            //               .description!
                            //               .en
                            //               .toString(),
                            //         );
                            //       } else {
                            //         return Container();
                            //       }
                            //     });
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
