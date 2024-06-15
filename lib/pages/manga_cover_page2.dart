import "package:flutter/material.dart";
import "package:manga_reader_app/pages/manga_reading_page.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:popover/popover.dart";

class MangaCoverPage2 extends StatefulWidget {
  const MangaCoverPage2({super.key});

  @override
  State<MangaCoverPage2> createState() => _MangaCoverPage2State();
}

class _MangaCoverPage2State extends State<MangaCoverPage2> {
  bool showFullDescription = false;
  GlobalKey listChapterKey = GlobalKey();
  int currentChapter = 1;

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://imgs.search.brave.com/sH-112am2bomixyOAXGyEXJ7YbjtjtK2Jc_0nNyf2sk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzAxLzRi/LzljLzAxNGI5Y2Uz/NmMyNmFhZGE4NTRl/ZGM5NzdlY2M3NzMy/LmpwZw"),
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
                  const Center(
                    child: Image(
                      image: NetworkImage(
                          "https://imgs.search.brave.com/sH-112am2bomixyOAXGyEXJ7YbjtjtK2Jc_0nNyf2sk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzAxLzRi/LzljLzAxNGI5Y2Uz/NmMyNmFhZGE4NTRl/ZGM5NzdlY2M3NzMy/LmpwZw"),
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
                    const Text(
                      "Naruto Shippuden",
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "20 Chapters",
                      style: TextStyle(
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
                            child: const Text(
                              "Naruto Uzumaki (うずまきナルト, Uzumaki Naruto) is a shinobi of Konohagakure's Uzumaki clan. He became the jinchūriki of the Nine-Tails on the day of his birth — a fate that caused him to be shunned by most of Konoha throughout his childhood. After joining Team Kakashi, Naruto worked hard to gain the village's acknowledgement all the while chasing his dream to become Hokage. In the following years, through many hardships and ordeals, he became a capable ninja, regarded as a hero both by the villagers, and soon after, the rest of the world, becoming known as the Hero of the Hidden Leaf (木ノ葉隠れの英雄, Konohagakure no Eiyū, literally meaning: Hero of the Hidden Tree Leaves). He soon proved to be one of the main factors in winning the Fourth Shinobi World War, leading him to achieve his dream and become the village's Seventh Hokage (七代目火影, Nanadaime Hokage, literally meaning: Seventh Fire Shadow).",
                              maxLines: 5,
                              style: TextStyle(
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
                            child: const Text(
                              "Naruto Uzumaki (うずまきナルト, Uzumaki Naruto) is a shinobi of Konohagakure's Uzumaki clan. He became the jinchūriki of the Nine-Tails on the day of his birth — a fate that caused him to be shunned by most of Konoha throughout his childhood. After joining Team Kakashi, Naruto worked hard to gain the village's acknowledgement all the while chasing his dream to become Hokage. In the following years, through many hardships and ordeals, he became a capable ninja, regarded as a hero both by the villagers, and soon after, the rest of the world, becoming known as the Hero of the Hidden Leaf (木ノ葉隠れの英雄, Konohagakure no Eiyū, literally meaning: Hero of the Hidden Tree Leaves). He soon proved to be one of the main factors in winning the Fourth Shinobi World War, leading him to achieve his dream and become the village's Seventh Hokage (七代目火影, Nanadaime Hokage, literally meaning: Seventh Fire Shadow).",
                              style: TextStyle(
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
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentChapter = index + 1;
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
                                  "Chapter   $currentChapter",
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
                                builder: (context) =>
                                    const MangaReadingPage()));
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
