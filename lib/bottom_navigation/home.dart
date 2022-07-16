import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastern_demo/bloc/home_bloc.dart';
import 'package:eastern_demo/constant/const_image.dart';
import 'package:eastern_demo/model/bottom_model.dart';
import 'package:eastern_demo/model/middle_model.dart';
import 'package:eastern_demo/model/top_model.dart';
import 'package:flutter/material.dart';

import '../widget/show_image.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(),
              _buildTopView(),
              _buidMiddleView(),
              _buildBottomView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ShowImage(
                imagePath: ConstImage.logo,
                height: 30,
              ),
              Spacer(),
              ShowImage(
                imagePath: ConstImage.search,
              ),
              SizedBox(
                width: 10,
              ),
              ShowImage(
                imagePath: ConstImage.shopping,
                height: 24,
                width: 24,
              )
            ],
          ),
        ),
        Positioned(
            right: 15,
            top: 5,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
              child: const Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ))
      ],
    );
  }

  Widget _buildDesignOccasion(List<DesignOccasion> list) {
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
              child: Stack(
                children: [
                  Expanded(
                    child: Image.network(
                      list[index].image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.white.withAlpha(200),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, top: 5.5, right: 5, bottom: 5.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].name!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  list[index].subName!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 8),
                                ),
                                const Text(
                                  '+Explore',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildRangeOfPattern(List<RangeOfPattern> list) {
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
                        Color.fromARGB(100, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list[index].name!.split(" ").first +
                          " \n" +
                          list[index].name!.split(" ").last,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
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
                          Text.rich(
                            TextSpan(
                                text: list[index]
                                    .name!
                                    .substring(
                                        0, list[index].name!.indexOf(" "))
                                    .toUpperCase(),
                                style: const TextStyle(fontSize: 10),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: list[index]
                                        .name!
                                        .substring(
                                            list[index].name!.indexOf(" "))
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                  width: double.infinity,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list[index].name ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildTittleView(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 25, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildUnstitched(List<Unstitched> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CarouselSlider(
          items: list.map((item) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(item.image!, fit: BoxFit.cover),
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        item.name ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
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
      height: 350,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: double.infinity,
                  child: Image.network(list[index].bannerImage!,
                      fit: BoxFit.cover),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(500, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          list[index].name ?? '',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          '+EXPLORE',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 0,
                //     // left:  MediaQuery.of(context).size.width * 0.95,
                //     child: Card(
                //       elevation: 15,
                //       color: Colors.black.withOpacity(0.4),
                //       child: SizedBox(
                //         height: 100,
                //         width: MediaQuery.of(context).size.width * 0.95,
                //         child: Center(
                //           child: Text(
                //             list[index].name ?? '',
                //             style: const TextStyle(color: Colors.yellow),
                //           ),
                //         ),
                //       ),
                //     ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dotsCreator(int length) {
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
                itemCount: length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: snapshot.data == index ? 4 : 2,
                      backgroundColor:
                          snapshot.data == index ? Colors.black : Colors.grey,
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 90,
                  child: ListView.builder(
                    itemCount: listMainSticky.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          homeBloc!.updateIndex(index);
                        },
                        child: Card(
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
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // CarouselSlider(
                //     items: [
                //       ClipRRect(
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(5.0)),
                //         child: Stack(
                //           children: [
                //             Column(
                //               children: [
                //                 Image.network(
                //                   "https://placeimg.com/868/430/fabric",
                //                   fit: BoxFit.cover,
                //                 ),
                //                 Expanded(
                //                   child: Container(
                //                     color: Colors.amber,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Positioned(
                //               bottom: 10,
                //               right: MediaQuery.of(context).size.width * 0.10,
                //               left: MediaQuery.of(context).size.width * 0.10,
                //               child: Card(
                //                 child: Container(
                //                   color: Colors.white,
                //                   height: 70,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),

                //     ],
                //     options: CarouselOptions(
                //       autoPlay: true,
                //       aspectRatio: 2.0,
                //       enlargeCenterPage: true,
                //       initialPage: 2,
                //       // enableInfiniteScroll: false
                //     )),

                StreamBuilder<int>(
                    stream: homeBloc!.topIndexStream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return CarouselSlider(
                          items: listMainSticky[snapshot.data!]!
                              .sliderImages!
                              .map((item) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: [
                                  Image.network(
                                    item.image!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                        height: 40,
                                        color: HexColor('#ccffcc'),
                                      )),
                                  Positioned(
                                    bottom: 10,
                                    right: MediaQuery.of(context).size.width *
                                        0.10,
                                    left: MediaQuery.of(context).size.width *
                                        0.10,
                                    child: Card(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        color: Colors.white,
                                        height: 75,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (item.title! +
                                                      "\n\nPlain Starting just at  ₹79/-")
                                                  .toUpperCase(),
                                              style:
                                                  const TextStyle(fontSize: 9),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              "+ Explore".toUpperCase(),
                                              style:
                                                  const TextStyle(fontSize: 6),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              initialPage: 0,
                              enableInfiniteScroll: false));
                    }),

                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
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
                const SizedBox(
                  height: 10,
                ),
                _dotsCreator(snapshot.data!.boutiqueCollection!.length),
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
                _buildTittleView('Range Of Pattern'),
                const SizedBox(
                  height: 10,
                ),
                _buildRangeOfPattern(snapshot.data!.rangeOfPattern!),
                const SizedBox(
                  height: 10,
                ),
                _buildTittleView('Design As Per Occasion'),
                const SizedBox(
                  height: 10,
                ),
                _buildDesignOccasion(snapshot.data!.designOccasion!),
              ],
            );
          }
          return const CircularProgressIndicator();
        });
  }
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
