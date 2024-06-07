import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class AllBooksComponent extends StatelessWidget {
  const AllBooksComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.75,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://imgs.search.brave.com/ac6ot2lsjBDpWk0rKT76Dn4Nh-gZbuSXXRj-IfxLnKE/rs:fit:500:0:0/g:ce/aHR0cDovL20uZ2V0/dHl3YWxscGFwZXJz/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAyMC8wMS9OYXJ1/dG8tV2FsbHBhcGVy/LWltYWdlcy5wbmc"))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Naruto, Vol 5",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "PoppinsRegular",
                fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Chapter 32",
            style: TextStyle(
                color: Colors.grey, fontFamily: "PoppinsRegular", fontSize: 12),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            maxLines: 2,
            style: TextStyle(
                color: Colors.grey, fontFamily: "PoppinsRegular", fontSize: 12),
          ),
        ],
      ),
    );
  }
}
