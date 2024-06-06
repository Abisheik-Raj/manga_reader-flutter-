import "package:flutter/material.dart";
import "package:manga_reader_app/components/button_component.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
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
          ],
        ),
      ),
    ));
  }
}
