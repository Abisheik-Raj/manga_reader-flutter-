import "package:flutter/material.dart";
import "package:manga_reader_app/components/all_books_component.dart";
import "package:manga_reader_app/components/button_component.dart";
import "package:manga_reader_app/components/for_you_component.dart";
import "package:manga_reader_app/components/shimmer_box_2.dart";
import "package:manga_reader_app/modals/recent_book_modal.dart";
import "package:manga_reader_app/pages/all_books_page.dart";
import "package:manga_reader_app/pages/manga_cover_page.dart";
import "package:manga_reader_app/services/firebase_updations.dart";
import "package:mangadex_library/mangadex_client.dart";
import "package:mangadex_library/mangadex_library.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:provider/provider.dart";
import "package:flutter/cupertino.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String clientId =
      "personal-client-a6a5fe43-df61-48a9-9084-11d7379a8ced-6bcb7bb9";
  String clientSecret = "zbwHSvb3jCwetCVXYzNswdldsCjlJh9T";

  String username = "AbisheikRaj";
  String password = "ItsChennai@2313";

  late MangadexPersonalClient client;
  late List<SearchData> books = [];
  late List<Map<String, String>> booksMap = [];
  @override
  void initState() {
    super.initState();

    FirebaseUpdations.listenToRecentBooks(context);

    client =
        MangadexPersonalClient(clientId: clientId, clientSecret: clientSecret);
    login();
    getBooksByRating();
  }

  void getBooksByRating() async {
    Search searchData = await client.search(
      contentRating: [ContentRating.safe],
    );
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

    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    RecentBookModal recentBook =
        Provider.of<RecentBookModal>(context, listen: true);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        recentBook.present
            ? SliverAppBar(
                backgroundColor: Colors.black,
                title: const Text(
                  "NOW",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "go3", fontSize: 25),
                ),
                actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ])
            : SliverToBoxAdapter(
                child: Container(),
              ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: recentBook.present
                      ? SizedBox(
                          width: double.infinity,
                          height: screenSize.height * 0.22,
                          child: Row(
                            children: [
                              Container(
                                width: screenSize.width * 0.4,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(recentBook.imageUrl!)),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    recentBook.title!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "Chapter ${recentBook.selectedChapter}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${(recentBook.selectedChapter! / recentBook.totalChapters! * 100).toStringAsFixed(0)} %",
                                        style: const TextStyle(
                                            color: Colors.amber,
                                            fontFamily: "PoppinsRegular",
                                            fontSize: 12.5),
                                      ),
                                      Text(
                                        "  •  ${(recentBook.totalChapters! - recentBook.selectedChapter!)} chapters left ",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsRegular",
                                            fontSize: 12.5),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.49,
                                    child: LinearPercentIndicator(
                                        padding: EdgeInsets.zero,
                                        lineHeight: 3,
                                        backgroundColor:
                                            const Color.fromRGBO(64, 65, 65, 1),
                                        progressColor: Colors.amber,
                                        percent: recentBook.selectedChapter! /
                                            recentBook.totalChapters!),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showCupertinoModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return MangaCoverPage(
                                                data: recentBook.bookMap!,
                                                selectedChapter:
                                                    recentBook.selectedChapter!,
                                                recents: recentBook.recents,
                                              );
                                            });
                                      },
                                      child: ButtonComponent(
                                          text: "CONTINUE READING"))
                                ],
                              )),
                            ],
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(
                  height: 10,
                ),
                recentBook.present
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "FOR YOU",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "go3",
                                fontSize: 25),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: 28,
                          )
                        ],
                      )
                    : Container(),
                recentBook.present
                    ? const SizedBox(
                        height: 15,
                      )
                    : Container(),
                recentBook.present
                    ? SizedBox(
                        height: screenSize.height * 0.28,
                        child: ListView.builder(
                            itemCount: recentBook.recents!.length - 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showCupertinoModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return MangaCoverPage(
                                          data: recentBook.recents![index],
                                          selectedChapter:
                                              recentBook.recents![index]
                                                  ["currentChapter"],
                                          recents: recentBook.recents,
                                        );
                                      });
                                },
                                child: ForYouComponent(
                                    data: recentBook.recents![index]),
                              );
                            })),
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ALL BOOKS",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "go3", fontSize: 25),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const AllBooksPage()));
                      },
                      child: const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 28,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        booksMap.isEmpty
            ? const ShimmerBox2()
            : SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.58,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    RecentBookModal recentBookModalProvider =
                        Provider.of<RecentBookModal>(context, listen: true);
                    List recents = recentBookModalProvider.recents ?? [];
                    int selectedChapter = 1;
                    if (recents.isNotEmpty) {
                      for (int i = 0; i < recents.length; i++) {
                        if (recents[i]["id"] == booksMap[index]["id"]) {
                          selectedChapter = recents[i]["currentChapter"];
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
                      child: AllBooksComponent(
                        imageUrl: booksMap[index]["imageUrl"]!,
                        title: booksMap[index]["title"]!,
                        description: booksMap[index]["description"]!,
                        publicDemographic: booksMap[index]["publicDemographic"]!
                                    .toString() ==
                                "null"
                            ? ""
                            : booksMap[index]["publicDemographic"]!.toString(),
                      ),
                    );
                  },
                  childCount: booksMap.length,
                ),
              ),
      ]),
    ));
  }
}
