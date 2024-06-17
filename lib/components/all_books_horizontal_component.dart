import "package:flutter/material.dart";

class AllBooksHorizontalComponent extends StatelessWidget {
  AllBooksHorizontalComponent({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.contentRating,
    required this.description,
    required this.publicDemographic,
  });
  String imageUrl;
  String title;
  String contentRating;
  String publicDemographic;
  String description;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * 0.22,
            width: screenSize.width * 0.32,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: screenSize.width * 0.55,
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "PoppinsRegular",
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: "\n$contentRating  $publicDemographic",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: "PoppinsRegular",
                              fontSize: 12,
                              height: 2.2),
                        ),
                      ],
                    ),
                  ),
                  // const Icon(
                  //   Icons.bookmark_border_outlined,
                  //   color: Colors.white,
                  //   size: 26,
                  // ),
                  Text(
                    "\n\n$description",
                    maxLines: 7,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "PoppinsRegular",
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
