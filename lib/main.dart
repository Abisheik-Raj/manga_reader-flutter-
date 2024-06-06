import "package:flutter/material.dart";
import "package:mangadex_library/mangadex_library.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const clientId =
        'personal-client-a6a5fe43-df61-48a9-9084-11d7379a8ced-6bcb7bb9';
    const clientSecret = 'zbwHSvb3jCwetCVXYzNswdldsCjlJh9T';

    final client =
        MangadexPersonalClient(clientId: clientId, clientSecret: clientSecret);

    var username = 'AbisheikRaj';
    var password = 'ItsChennai@2313';

    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () async {
                try {
                  await client.login(username, password);
                  print("Successfully logged in!");
                  var searchData = await client.search(query: 'death note');

                  var mangaID = searchData.data![0].id;
                  print(mangaID);
                  print(await client.getCoverArt([mangaID.toString()]));
                } catch (e) {
                  print("Error logging in");
                }
              },
              child: const Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("yes"),
                  Image(
                    image: NetworkImage(
                        "https://uploads.mangadex.org/covers/75ee72ab-c6bf-4b87-badd-de839156934c/c104b84e-357a-4fbf-8c8c-695beb674e59.jpg"),
                  ),
                ],
              ))),
    );
  }
}
