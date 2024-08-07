// ignore_for_file: must_be_immutable

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:manga_reader_app/modals/book.dart";
import "package:manga_reader_app/services/auth_services.dart";
import "package:mangadex_library/mangadex_client.dart";
import "package:mangadex_library/mangadex_library.dart";
import "package:photo_view/photo_view.dart";
import "package:popover/popover.dart";

class MangaReadingPage extends StatefulWidget {
  MangaReadingPage({
    super.key,
    required this.data,
    required this.selectedChapter,
    required this.totalChapters,
    required this.chapterList,
    required this.client,
    required this.callback,
  });
  int selectedChapter;
  int totalChapters;
  List<InternalChapterData> chapterList;
  MangadexPersonalClient client;
  Map data;
  Function(int) callback;

  @override
  State<MangaReadingPage> createState() => _MangaReadingPageState();
}

class _MangaReadingPageState extends State<MangaReadingPage> {
  GlobalKey listChapterKey = GlobalKey();
  List<String> pageImageLinks = [];
  ScrollController chapterController = ScrollController();

  @override
  void initState() {
    super.initState();
    getPageImageLinks();
  }

  void getPageImageLinks() async {
    pageImageLinks = [];

    var baseUrl = await widget.client.getBaseUrl(
        widget.chapterList[widget.selectedChapter - 1].id.toString());

    for (var filename in baseUrl.chapter!.dataSaver!) {
      pageImageLinks.add(widget.client.constructPageUrl(
          baseUrl.baseUrl!, true, baseUrl.chapter!.hash!, filename));
    }

    setState(() {});
  }

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
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          chapterController.jumpTo(
                            (widget.selectedChapter - 1) * 40.0,
                          );
                        });
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: widget.totalChapters,
                          controller: chapterController,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.selectedChapter = index + 1;
                                      Book book = Book(
                                        id: widget.data["id"],
                                        title: widget.data["title"],
                                        description: widget.data["description"],
                                        contentRating:
                                            widget.data["contentRating"],
                                        publicDemographic:
                                            widget.data["publicDemographic"],
                                        imageUrl: widget.data["imageUrl"],
                                        currentChapter: widget.selectedChapter,
                                        totalChapters: widget.totalChapters,
                                      );

                                      AuthServices authServices =
                                          AuthServices();

                                      widget.callback(widget.selectedChapter);
                                      authServices.updateRecents(book);

                                      Navigator.pop(context);
                                      getPageImageLinks();
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
                        "Chapter   ${widget.selectedChapter}",
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
                  childCount: pageImageLinks.length,
                  (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: screenSize.height * 1,
                        child: PhotoView(
                            loadingBuilder: (context, event) {
                              return Container();
                            },
                            minScale: PhotoViewComputedScale.contained,
                            maxScale: PhotoViewComputedScale.covered * 5,
                            imageProvider: NetworkImage(pageImageLinks[index])),
                      ))),
            ),
          ],
        ),
      ),
    ));
  }
}
