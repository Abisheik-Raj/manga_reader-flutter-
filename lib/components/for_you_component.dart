import "package:flutter/material.dart";

class ForYouComponent extends StatelessWidget {
  const ForYouComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: 250,
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
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://imgs.search.brave.com/HYLDE7nxxaKdA5BiBz7IXV_sGnHKydfmeJbiFCa-h18/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMxLmNicmltYWdl/cy5jb20vd29yZHBy/ZXNzL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDI0LzAzLzEwLWJl/c3QtZmlnaHRlcnMt/aW4tYmxlYWNoLXJh/bmtlZC5qcGc"),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Bleach, Vol 5",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PoppinsRegular",
                  fontSize: 15),
            ),
            const Text(
              "Chapter 32",
              style: TextStyle(
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
