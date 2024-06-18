// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

class AllBooksComponent extends StatelessWidget {
  AllBooksComponent({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.publicDemographic,
  });

  String imageUrl;
  String title;
  String description;
  String publicDemographic;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "PoppinsRegular",
                fontSize: 15,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 5,
          ),
          publicDemographic.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.amber,
                  ),
                  child: Text(
                    publicDemographic,
                    style: const TextStyle(
                        fontFamily: "go3", color: Colors.black, fontSize: 14),
                  ),
                )
              : Container(),
          const SizedBox(
            height: 5,
          ),
          Text(
            description,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.grey,
                fontFamily: "PoppinsRegular",
                fontSize: 12,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
