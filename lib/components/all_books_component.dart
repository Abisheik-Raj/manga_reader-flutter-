// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

class AllBooksComponent extends StatefulWidget {
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
  State<AllBooksComponent> createState() => _AllBooksComponentState();
}

class _AllBooksComponentState extends State<AllBooksComponent> {
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
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.imageUrl),
                    onError: (exception, stackTrace) {
                      setState(() {
                        widget.imageUrl =
                            'https://imgs.search.brave.com/fXArEBHCg1XnRCIrQhgRljgvjO2sGwDAgvd7EkavsrM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/cHVibGljZG9tYWlu/cGljdHVyZXMubmV0/L3BpY3R1cmVzLzI4/MDAwMC92ZWxrYS9u/b3QtZm91bmQtaW1h/Z2UtMTUzODM4NjQ3/ODdsdS5qcGc'; // Use a local placeholder image
                      });
                    })),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
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
          widget.publicDemographic.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.amber,
                  ),
                  child: Text(
                    widget.publicDemographic,
                    style: const TextStyle(
                        fontFamily: "go3", color: Colors.black, fontSize: 14),
                  ),
                )
              : Container(),
          const SizedBox(
            height: 5,
          ),
          widget.description == "null"
              ? const Text(
                  "NO DESCRIPTION",
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "PoppinsRegular",
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                )
              : Text(
                  widget.description,
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
