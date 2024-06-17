import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
          baseColor: const Color.fromRGBO(37, 36, 36, 1),
          highlightColor: const Color.fromARGB(255, 88, 86, 86),
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenSize.height * 0.22,
                      width: screenSize.width * 0.32,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: screenSize.height * 0.02,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
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
                              height: 20,
                            ),
                            Container(
                              height: screenSize.height * 0.135,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white),
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
              ],
            ),
          )),
    );
  }
}
