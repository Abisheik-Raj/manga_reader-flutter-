// ignore_for_file: must_be_immutable

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
      child: SizedBox(
        width: double.infinity,
        height: screenSize.height * 0.22,
        child: Row(
          children: [
            Container(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Text(
                  //   "$contentRating  $publicDemographic",
                  //   maxLines: 1,
                  //   style: const TextStyle(
                  //       color: Colors.grey,
                  //       fontFamily: "PoppinsRegular",
                  //       fontSize: 12,
                  //       height: 2.2),
                  // ),
                  publicDemographic.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.amber,
                          ),
                          child: Text(
                            publicDemographic,
                            style: const TextStyle(
                                fontFamily: "go3",
                                color: Colors.black,
                                fontSize: 14),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 15,
                  ),

                  Expanded(
                    child: Text(
                      description,
                      maxLines: 4,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: "PoppinsRegular",
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
