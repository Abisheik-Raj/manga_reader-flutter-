// ignore_for_file: prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:numberpicker/numberpicker.dart";
import "package:page_flip/page_flip.dart";

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  int chapterNumber = 1;
  int currentPage = 1;
  final controller = GlobalKey<PageFlipWidgetState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CHAPTER",
                style: TextStyle(
                    fontFamily: "go3", color: Colors.black, fontSize: 25),
              ),
              NumberPicker(
                  itemHeight: 30,
                  selectedTextStyle: const TextStyle(
                      fontFamily: "go3", color: Colors.black, fontSize: 25),
                  textStyle: const TextStyle(
                      fontFamily: "go3", color: Colors.black, fontSize: 18),
                  minValue: 1,
                  maxValue: 30,
                  value: chapterNumber,
                  onChanged: (value) {
                    setState(() {
                      chapterNumber = value;
                    });
                  }),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          SizedBox(
            key: controller,
            width: double.infinity,
            height: screenSize.height * 0.7,
            child: PageFlipWidget(
              isRightSwipe: false,
              lastPage: const Image(
                image: NetworkImage(
                    "https://imgs.search.brave.com/SUOxQ-DV-_2SDzMY2KGTZ5zem6srX8EhB-NxpW1Aedo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2M0L2E1/L2FiL2M0YTVhYjlj/YzlkOWQ3ZTE3ZjM0/YjRkOGE3YzFmZjNm/LmpwZw"),
              ),
              children: [
                const Image(
                  image: NetworkImage(
                      "https://imgs.search.brave.com/fx0xGkxPgl44pOX8jBtgKKNMGx30hOSWLnT9sg8rFPc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzMyL2Y4/L2Y1LzMyZjhmNWMy/YWJlZDlkYzMyZDAw/YjNlZGVkYjZiMjJh/LmpwZw"),
                ),
                const Image(
                  image: NetworkImage(
                      "https://imgs.search.brave.com/cVVkfDVDaLf0LTo0_TJeyOcWhPZIAp35gS4xTPEDxRQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzU5Lzgz/LzIzLzU5ODMyMzY4/ZDlmNmI3ZWEwODYz/NmZlNmNjZWU0Nzhh/LmpwZw"),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 15),
            child: Text(
              "$currentPage / 3",
              style: const TextStyle(
                  fontFamily: "go3", color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
