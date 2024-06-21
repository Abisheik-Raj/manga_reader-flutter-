import "package:flutter/material.dart";

class ForYouComponent extends StatelessWidget {
  const ForYouComponent({super.key, required this.data});
  final Map data;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: screenSize.height * 0.28,
        width: screenSize.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: screenSize.width * 0.75,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(data["imageUrl"]!),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data["title"]!,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "PoppinsRegular",
                  fontSize: 15),
            ),
            Text(
              "Chapter ${data["currentChapter"]}",
              style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: "PoppinsRegular",
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
