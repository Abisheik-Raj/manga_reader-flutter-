import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:popover/popover.dart";

class MangaReadingPage extends StatefulWidget {
  const MangaReadingPage({super.key});

  @override
  State<MangaReadingPage> createState() => _MangaReadingPageState();
}

class _MangaReadingPageState extends State<MangaReadingPage> {
  GlobalKey listChapterKey = GlobalKey();
  int currentChapter = 1;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CupertinoScrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.black,
              leading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "画",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  showPopover(
                      backgroundColor: const Color.fromRGBO(39, 39, 38, 1),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:
                                          const Color.fromRGBO(39, 39, 38, 1),
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
                                  color: Colors.white.withOpacity(0.5),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Image(
                          image: NetworkImage(
                              "https://imgs.search.brave.com/GtndKDinPmkziYsXLceZY_lDIDYK9BB4kZrNFEw-5YQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2M4L2Ri/Lzc4L2M4ZGI3OGY0/YTA2NDM5Y2IzNTc0/Njc4OThkZDI5ODFi/LmpwZw"),
                        ),
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
