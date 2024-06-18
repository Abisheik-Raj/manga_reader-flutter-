import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

class ShimmerBox2 extends StatelessWidget {
  const ShimmerBox2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.58,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Shimmer.fromColors(
              baseColor: const Color.fromRGBO(37, 36, 36, 1),
              highlightColor: const Color.fromARGB(255, 88, 86, 86),
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenSize.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: screenSize.height * 0.02,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: screenSize.height * 0.02,
                    width: screenSize.width * 0.25,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 6,
      ),
    );
  }
}
