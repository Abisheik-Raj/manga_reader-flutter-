import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              centerTitle: true,
              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PoppinsRegular",
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Hero(
                    tag: "hero",
                    child: Material(
                      color: Colors.transparent,
                      child: CircleAvatar(
                        radius: 60,
                        foregroundImage: NetworkImage(
                            "https://imgs.search.brave.com/Dnaytwz75nADA9rj9UB-7z4lnMnDtKmzfTa4U8Evk24/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMubmV3czlsaXZl/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAyMy8xMC8yZjYz/MTQ3YTBjMDM2Y2Rm/M2I3NTIzNDI4ZDQx/Y2EzOS5qcGc"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Thalapathy Vijay",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "@vijay",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "PoppinsRegular",
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(48, 49, 49, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Recents",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular",
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromRGBO(75, 74, 74, 1)),
                                  child: const Text(
                                    "56",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Favourites",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "PoppinsSemibold",
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: const Text(
                                    "10",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
