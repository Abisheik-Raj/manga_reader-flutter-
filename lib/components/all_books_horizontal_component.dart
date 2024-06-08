import "package:flutter/material.dart";

class AllBooksHorizontalComponent extends StatelessWidget {
  const AllBooksHorizontalComponent({super.key});

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
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://imgs.search.brave.com/x_alUDJ6MKUxbKGAywVqVAMLpZGLf5bqwcpLDkHb_Yo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFtOWN0bWNSbkwu/anBn")),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Solo Leveling, Vol 5",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PoppinsRegular",
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "\nHye Young im",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 12,
                                  height: 2.2),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                    ],
                  ),
                  const Text(
                    "\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    maxLines: 7,
                    style: TextStyle(
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
