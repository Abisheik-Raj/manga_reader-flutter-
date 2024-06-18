import "package:flutter/material.dart";
import "package:manga_reader_app/components/all_books_component.dart";
import "package:manga_reader_app/components/button_component.dart";
import "package:manga_reader_app/components/for_you_component.dart";
import "package:manga_reader_app/components/shimmer_box_2.dart";
import "package:manga_reader_app/pages/all_books_page.dart";
import "package:manga_reader_app/pages/manga_cover_page2.dart";
import "package:mangadex_library/mangadex_client.dart";
import "package:mangadex_library/mangadex_library.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

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

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "NOW",
            style:
                TextStyle(color: Colors.white, fontFamily: "go3", fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://imgs.search.brave.com/NtEg4Kwxec3NnbcaKqP5UpxCxevRHyMymoZk3emiusQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLmV0/c3lzdGF0aWMuY29t/LzM3MjY4NzM3L3Iv/aWwvNjhlNTZmLzU3/Mzk1NjQyNzkvaWxf/NjAweDYwMC41NzM5/NTY0Mjc5XzQyYmku/anBn")),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Solo Leveling, Vol 5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 18),
                              ),
                              const Text(
                                "Chapter 32",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 12),
                              ),
                              const Text(
                                "Hye Young im",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "78%",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 12.5),
                                  ),
                                  Text(
                                    "  •  8 chapters left ",
                                    style: TextStyle(
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
                                  percent: 0.78,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ButtonComponent(text: "CONTINUE READING")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FOR YOU",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "go3", fontSize: 25),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 28,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ForYouComponent(),
                      ForYouComponent(),
                    ],
                  ),
                ),
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
                            MaterialPageRoute(
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MangaCoverPage2(data: booksMap[index])));
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
