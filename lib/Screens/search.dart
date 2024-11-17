import 'package:flutter/material.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  TextEditingController searchTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: const Color.fromARGB(135, 124, 112, 97),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFAE3C6),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(158, 79, 45, 25),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 5))
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTxt,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: "Search...",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              searchTxt.clear();
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // Close the popup
                        Navigator.of(context).pop();
                      },
                      icon: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(246, 79, 45, 25),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // You can add additional search suggestions or history here
            // For example, a ListView of recent searches
          ],
        ),
      ),
    );
  }
}
