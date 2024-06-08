import "package:flutter/material.dart";
import "package:manga_reader_app/pages/reading_page.dart";

class MangaCoverPage extends StatelessWidget {
  const MangaCoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Transform(
          transform: Matrix4.skewX(-0.4),
          child: GestureDetector(
            onTap: () {},
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReadingPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.07,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "READ NOW",
                    style: TextStyle(
                      fontFamily: "go3",
                      color: Colors.white,
                      fontSize: screenSize.height * 0.032,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.7,
                child: Stack(
                  children: [
                    Image(
                      fit: BoxFit.fill,
                      height: screenSize.height * 0.7,
                      image: const NetworkImage(
                          "https://imgs.search.brave.com/5hsxVYESL9GuGZXvWVYR2dqrBp21_XIaRFFjM-rJNc4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9tYW5nYS1zY2Vu/ZS10aGF0LW1vdmVz/LWZhc3QtcGFjZS1p/cy1zZXQtdXAtd2l0/aC1tYW5nYS1tb3Rp/b24tc3BlZWQtbGlu/ZXNfNzY5NjQtMTg3/MTU4LmpwZz9zaXpl/PTYyNiZleHQ9anBn"),
                    ),
                    const Positioned(
                      top: 140,
                      left: 75,
                      child: Image(
                        fit: BoxFit.fill,
                        width: 250,
                        height: 350,
                        image: NetworkImage(
                            "https://imgs.search.brave.com/x_alUDJ6MKUxbKGAywVqVAMLpZGLf5bqwcpLDkHb_Yo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFtOWN0bWNSbkwu/anBn"),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "CHAINSAW MAN",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "go3", fontSize: 50),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  "チェーンソーマン",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "go3", fontSize: 30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Chainsaw Man is a Japanese manga series written and illustrated by Tatsuki Fujimoto. The story takes place in a world where humans coexist with devils, creatures that feed on human flesh. The main protagonist, Denji, is a young man who lives in poverty and makes a living by hunting devils and selling their remains.",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "PoppinsRegular",
                      fontSize: 12.5),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
