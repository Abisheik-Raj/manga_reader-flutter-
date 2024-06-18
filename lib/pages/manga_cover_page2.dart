// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:manga_reader_app/pages/manga_reading_page.dart";
import "package:mangadex_library/mangadex_client.dart";
import "package:mangadex_library/mangadex_library.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:popover/popover.dart";

class MangaCoverPage2 extends StatefulWidget {
  MangaCoverPage2({super.key, required this.data});
  Map<String, String> data;

  @override
  State<MangaCoverPage2> createState() => _MangaCoverPage2State();
}

class _MangaCoverPage2State extends State<MangaCoverPage2> {
  bool showFullDescription = false;
  GlobalKey listChapterKey = GlobalKey();
  int selectedChapter = 1;
  ScrollController chapterController = ScrollController();

  String clientId =
      "personal-client-a6a5fe43-df61-48a9-9084-11d7379a8ced-6bcb7bb9";
  String clientSecret = "zbwHSvb3jCwetCVXYzNswdldsCjlJh9T";

  String username = "AbisheikRaj";
  String password = "ItsChennai@2313";

  late MangadexPersonalClient client;

  List<InternalChapterData> chapterList = [];

  @override
  void initState() {
    super.initState();
    client =
        MangadexPersonalClient(clientId: clientId, clientSecret: clientSecret);
    login();
    getChapterList();
  }

  void getChapterList() async {
    int offset = 0;

    ChapterData result;

    while (true) {
      result = await client.getChapters(widget.data["id"].toString(),
          limit: 100, offset: offset);

      if (result.data!.isEmpty) {
        break;
      }

      offset += 100;
      for (var i in result.data!) {
        chapterList.add(i);
      }
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.data["imageUrl"].toString()),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: screenSize.height * 0.02,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: const Center(
                          child: Text(
                            "×",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image(
                      image: NetworkImage(widget.data["imageUrl"].toString()),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data["title"].toString(),
                      style: const TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    chapterList.isEmpty
                        ? Container()
                        : Text(
                            "${chapterList.length} Chapters",
                            style: const TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    showFullDescription == false
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                showFullDescription = !showFullDescription;
                              });
                            },
                            child: Text(
                              widget.data["description"].toString(),
                              maxLines: 5,
                              style: const TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.white,
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                showFullDescription = !showFullDescription;
                              });
                            },
                            child: Text(
                              widget.data["description"].toString(),
                              style: const TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showPopover(
                                backgroundColor:
                                    const Color.fromRGBO(39, 39, 38, 1),
                                direction: PopoverDirection.bottom,
                                height: (screenSize.height * 0.04 * 5),
                                width: screenSize.width * 0.4,
                                context: listChapterKey.currentContext!,
                                bodyBuilder: (context) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    chapterController.jumpTo(
                                      (selectedChapter - 1) * 40.0,
                                    );
                                  });

                                  return ListView.builder(
                                    controller: chapterController,
                                    padding: EdgeInsets.zero,
                                    itemCount: chapterList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedChapter = index + 1;
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromRGBO(
                                                    39, 39, 38, 1),
                                              ),
                                              child: Text(
                                                "Chapter  ${index + 1}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "PoppinsSemiBold",
                                                  fontSize: 14.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            height: 0.1,
                                            thickness: 0.4,
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                          },
                          child: Container(
                            key: listChapterKey,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromRGBO(39, 39, 38, 1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Chapter   $selectedChapter",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsSemiBold",
                                    fontSize: 14.5,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
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
                      height: 10,
                    ),
                    SizedBox(
                      width: screenSize.width * 1,
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        lineHeight: 3,
                        backgroundColor: const Color.fromRGBO(64, 65, 65, 1),
                        progressColor: Colors.amber,
                        percent: 0.78,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MangaReadingPage(
                                      selectedChapter: selectedChapter,
                                      totalChapters: chapterList.length,
                                      chapterList: chapterList,
                                      client: client,
                                    )));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: const Center(
                          child: Text(
                            "Continue Reading",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "go3",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
