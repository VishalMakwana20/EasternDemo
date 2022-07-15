import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastern_demo/bloc/home_bloc.dart';
import 'package:eastern_demo/model/bottom_model.dart';
import 'package:eastern_demo/model/middle_model.dart';
import 'package:eastern_demo/model/top_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

HomeBloc? homeBloc;

class _HomeState extends State<Home> {
  /// =========== Dots Create =============
  ScrollController _scrollController = ScrollController();
  final StreamController<int> _dotsController =
      StreamController<int>.broadcast();
  double itemSize = 0;
  // to get the current Position of Scrolled Pictures
  void _scrollListener() {
    int currentIndex = (_scrollController.offset / itemSize).round();
    _dotsController.sink.add(currentIndex);
  }

  // set itemSize
  void initializeScrollController(BuildContext context) {
    setState(() {
      itemSize = MediaQuery.of(context).size.width;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    homeBloc = HomeBloc();
    homeBloc!.fetchTopData();
    homeBloc!.fetchMiddleData();
    homeBloc!.fetchBottomData();
    super.initState();
  }

  @override
  void dispose() {
    _dotsController.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    itemSize == 0 ? initializeScrollController(context) : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopView(),
            _buidMiddleView(),
            _buildBottomView(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignOccasion() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      "https://placeimg.com/868/430/fabric",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 48, 180, 116),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, top: 5.5, right: 5, bottom: 5.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BIRTHDAY',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'COLLECTION',
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                '+Explore',
                                style: TextStyle(fontSize: 8),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildRangeOfPattern() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return ClipOval(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  "https://placeimg.com/868/430/fabric",
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    'ABSTRACT\nPRINT',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildShopByCategory(List<ShopByCategory> list) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: list.length,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      list[index].image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: HexColor(list[index].tintColor!),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   list[index].name!,
                          //   style: const TextStyle(fontSize: 10),
                          // ),

                          Text.rich(TextSpan(
                              text: list[index]
                                  .name!
                                  .substring(0, list[index].name!.indexOf(" "))
                                  .toUpperCase(),
                              style: const TextStyle(fontSize: 10),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: list[index]
                                      .name!
                                      .substring(list[index].name!.indexOf(" "))
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ])),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '+Explore',
                            style: TextStyle(fontSize: 8),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildShopByFabric(List<ShopByFabric> list) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: list.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return ClipOval(
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Image.network(
                  list[index].image!,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    list[index].name ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildTittleView(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }

  Widget _buildUnstitched(List<Unstitched> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CarouselSlider(
          items: [
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network("https://placeimg.com/868/430/fabric",
                    fit: BoxFit.cover),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    // color: Colors.transparent,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black38,
                          Colors.black38,
                          Colors.black38,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: const Text(
                      'No Image',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          options: CarouselOptions(
            // disableCenter: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,

            aspectRatio: 1,
            enlargeCenterPage: true,
            initialPage: 2,
            // enableInfiniteScroll: false
          )),
    );
  }

  Widget _buildboutique(List<BoutiqueCollection> list) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 95,
      height: 350,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  height: 350,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Image.network("https://placeimg.com/868/430/fabric",
                      fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 0,
                    // left:  MediaQuery.of(context).size.width * 0.95,
                    child: Card(
                      elevation: 15,
                      color: Colors.black.withOpacity(0.4),
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: const Center(
                          child: Text(
                            'Trial Text',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dotsCreator() {
    return SizedBox(
      height: 25,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<int>(
          stream: _dotsController.stream,
          initialData: 0,
          builder: (context, AsyncSnapshot<int> snapshot) {
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: snapshot.data == index ? 10 : 5,
                      // maxRadius: snapshot.data == index ? 10 : 5,
                      backgroundColor:
                          snapshot.data == index ? Colors.red : Colors.black,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }

  Widget _buildTopView() {
    return StreamBuilder<List<MainStickyMenu?>>(
        stream: homeBloc!.topStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var listMainSticky = snapshot.data!;
            return Column(
              children: [
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: listMainSticky.length,
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox(
                          width: 120,
                          child: Column(
                            children: [
                              Image.network(
                                listMainSticky[index]!.image!,
                                height: 60,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                listMainSticky[index]?.title ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CarouselSlider(
                    items: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  "https://placeimg.com/868/430/fabric",
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              right: MediaQuery.of(context).size.width * 0.10,
                              left: MediaQuery.of(context).size.width * 0.10,
                              child: Card(
                                child: Container(
                                  color: Colors.white,
                                  height: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      initialPage: 2,

                      // enableInfiniteScroll: false
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        });
  }

  Widget _buidMiddleView() {
    return StreamBuilder<MiddlePage>(
        stream: homeBloc!.middleStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                _buildTittleView('Shop By Category'),
                _buildShopByCategory(snapshot.data!.shopByCategory!),
                const SizedBox(
                  height: 10,
                ),
                _buildTittleView('Shop By Fabric Material'),
                const SizedBox(
                  height: 10,
                ),
                _buildShopByFabric(snapshot.data!.shopByFabric!),
                const SizedBox(
                  height: 10,
                ),
                _buildTittleView('Unstitched'),
                const SizedBox(
                  height: 5,
                ),
                _buildUnstitched(snapshot.data!.unstitched!),
                const SizedBox(
                  height: 10,
                ),
                _buildTittleView('Boutique Collection'),
                const SizedBox(
                  height: 10,
                ),
                _buildboutique(snapshot.data!.boutiqueCollection!),
              ],
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget _buildBottomView() {
    return StreamBuilder<BottomPage>(
        stream: homeBloc!.bottomStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                _dotsCreator(),
                const SizedBox(
                  height: 10,
                ),
                _buildTittleView('Range Of Pattern'),
                const SizedBox(
                  height: 10,
                ),
                _buildRangeOfPattern(),
                const SizedBox(
                  height: 10,
                ),
                _buildTittleView('Design As Per Occasion'),
                const SizedBox(
                  height: 10,
                ),
                _buildDesignOccasion(),
              ],
            );
          }
          return const CircularProgressIndicator();
        });
  }

  // Widget _buildboutique() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: CarouselSlider(
  //         items: [
  //           Stack(
  //             fit: StackFit.expand,
  //             children: <Widget>[
  //               Image.network("https://placeimg.com/868/430/fabric",
  //                   fit: BoxFit.cover),
  //               Positioned(
  //                 bottom: 0.0,
  //                 left: 0.0,
  //                 right: 0.0,
  //                 child: Container(
  //                   // color: Colors.transparent,
  //                   decoration: const BoxDecoration(
  //                     gradient: LinearGradient(
  //                       colors: [
  //                         Colors.black38,
  //                         Colors.black38,
  //                         Colors.black38,
  //                       ],
  //                       begin: Alignment.bottomCenter,
  //                       end: Alignment.topCenter,
  //                     ),
  //                   ),
  //                   padding: const EdgeInsets.symmetric(
  //                       vertical: 10.0, horizontal: 20.0),
  //                   child: const Text(
  //                     'No Image',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 20.0,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //         options: CarouselOptions(
  //           disableCenter: true,
  //           aspectRatio: 1,
  //           initialPage: 1,
  //           // enableInfiniteScroll: false
  //         )),
  //   );
  // }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
