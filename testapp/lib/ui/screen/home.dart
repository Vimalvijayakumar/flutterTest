import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testapp/ui/screen/search.dart';
import 'package:testapp/utils/colors.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  final List<String> imgList = [
    'assets/slider1.png',
    'assets/slider1.png',
    'assets/slider1.png',
    'assets/slider1.png',
    'assets/slider1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Appbar(),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppColors.gray),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          onChanged: (value) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                          },
                          controller: searchController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                              hintStyle: TextStyle(color: AppColors.gray),
                              icon: Icon(Icons.search_outlined)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 100,
                        //aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.1,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imgList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Image.asset(
                                  "${i}",
                                  fit: BoxFit.cover,
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Categories(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Recent product",
                      style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const RecendProduct(),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                  size: 20,
                ),
                label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_outlined,
                  size: 20,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  size: 20,
                ),
                label: "Account"),
          ]),
    );
  }
}

class RecendProduct extends StatefulWidget {
  const RecendProduct({
    super.key,
  });

  @override
  State<RecendProduct> createState() => _RecendProductState();
}

class _RecendProductState extends State<RecendProduct> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 1.9;
    return Container(
        child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            controller: new ScrollController(keepScrollOffset: false),
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
                        "assets/moniter.png",
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
                            "Moniter LG 22 4K",
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ).toList()));
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryItems(
            imgName: "apparel.png",
            title: "Apparel",
          ),
          SizedBox(
            width: 20,
          ),
          CategoryItems(
            imgName: "school.png",
            title: "School",
          ),
          SizedBox(
            width: 20,
          ),
          CategoryItems(
            imgName: "sports.png",
            title: "Sports",
          ),
          SizedBox(
            width: 20,
          ),
          CategoryItems(
            imgName: "electronics.png",
            title: "Electonics",
          ),
          SizedBox(
            width: 20,
          ),
          CategoryItems(
            imgName: "all.png",
            title: "All",
          ),
        ],
      ),
    );
  }
}

class CategoryItems extends StatelessWidget {
  final String imgName;
  final String title;
  const CategoryItems({
    super.key,
    required this.imgName,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            "assets/$imgName",
            height: 60,
            width: 60,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$title',
          style: const TextStyle(color: AppColors.gray, fontSize: 16),
        )
      ],
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery address",
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                )),
            Text("Salatiga city, Central Java",
                style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Spacer(),
        badges.Badge(
          badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.shopping_cart_outlined),
        ),
        SizedBox(
          width: 15,
        ),
        Icon(Icons.notifications_outlined)
      ],
    );
  }
}
