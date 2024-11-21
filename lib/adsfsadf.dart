import 'package:flutter/material.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class CustomScrollExample extends StatelessWidget {
  const CustomScrollExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // SliverAppBar with a flexible space
            SliverAppBar(
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                title: Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Ensures it doesn't overflow
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Unforgiven",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontFamily: "Cousine",
                            fontWeight: FontWeight.bold,
                            fontSize: 20), // Adjusted font size
                      ),
                      Text(
                        "Metallica",
                        style: TextStyle(
                            color: AppColor.secondaryColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // SliverList with ListTile items
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.star),
                    title: Text('List Item $index'),
                    subtitle: const Text('Subtitle here'),
                  );
                },
                childCount: 10, // Number of items
              ),
            ),
            // SliverGrid with grid items
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        'Grid $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                childCount: 8, // Number of grid items
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0, // Aspect ratio of items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
