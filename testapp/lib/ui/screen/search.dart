import 'package:flutter/material.dart';
import 'package:testapp/utils/colors.dart';
import 'package:badges/badges.dart' as badges;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 1.9;

    return Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.gray),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const TextField(
              //controller: searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search here...",
                  hintStyle: TextStyle(color: AppColors.gray),
                  icon: Icon(Icons.search_outlined)),
            ),
          ),
          actions: [
            const Stack(
              children: [
                badges.Badge(
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
                  badgeContent: Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(Icons.shopping_cart_outlined),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Text("Search result for \"Earphone\""),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: const Text("Filter"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                      childAspectRatio: (itemWidth / itemHeight),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      controller: ScrollController(keepScrollOffset: false),
                      children: List.generate(
                        10,
                        (index) => Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/earphone1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Earphone for moniter",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '\$199.99',
                                      style: TextStyle(
                                          color: AppColors.dark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: SizedBox(
                                  height: 35,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.green,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero)),
                                      onPressed: () {},
                                      child: const Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ).toList()),
                ),
              ],
            )));
  }
}
