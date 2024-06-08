import "package:flutter/material.dart";
import "package:manga_reader_app/components/all_books_component.dart";
import "package:manga_reader_app/components/button_component.dart";
import "package:manga_reader_app/components/for_you_component.dart";
import "package:manga_reader_app/pages/all_books_page.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "NOW",
            style:
                TextStyle(color: Colors.white, fontFamily: "go3", fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: screenSize.width * 0.4,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://imgs.search.brave.com/NtEg4Kwxec3NnbcaKqP5UpxCxevRHyMymoZk3emiusQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLmV0/c3lzdGF0aWMuY29t/LzM3MjY4NzM3L3Iv/aWwvNjhlNTZmLzU3/Mzk1NjQyNzkvaWxf/NjAweDYwMC41NzM5/NTY0Mjc5XzQyYmku/anBn")),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Solo Leveling, Vol 5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 18),
                              ),
                              const Text(
                                "Chapter 32",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 12),
                              ),
                              const Text(
                                "Hye Young im",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "78%",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 12.5),
                                  ),
                                  Text(
                                    "  •  8 chapters left ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 12.5),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.49,
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  lineHeight: 3,
                                  backgroundColor:
                                      const Color.fromRGBO(64, 65, 65, 1),
                                  progressColor: Colors.amber,
                                  percent: 0.78,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ButtonComponent(text: "CONTINUE READING")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FOR YOU",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "go3", fontSize: 25),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 28,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ForYouComponent(),
                      ForYouComponent(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ALL BOOKS",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "go3", fontSize: 25),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllBooksPage()));
                      },
                      child: const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 28,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 0.62,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const AllBooksComponent();
            },
            childCount: 10,
          ),
        ),
      ]),
    ));
  }
}
