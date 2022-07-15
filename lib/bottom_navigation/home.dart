import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: 6,
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          Image.network(
                            "https://placeimg.com/868/430/fabric",
                            height: 60,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Fabrics ewrgergergergerg',
                            textAlign: TextAlign.center,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
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
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            // Stack(
                            //   children: <Widget>[
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
            _buildTittleView('Shop By Category'),
            _buildShopByCategory(),
            const SizedBox(
              height: 10,
            ),
            _buildTittleView('Shop By Fabric Material'),
            const SizedBox(
              height: 10,
            ),
            _buildShopByFabric(),
            const SizedBox(
              height: 10,
            ),
            _buildTittleView('Unstitched'),
            const SizedBox(
              height: 5,
            ),
            _buildUnstitched()
          ],
        ),
      ),
    );
  }

  Widget _buildShopByCategory() {
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
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'BEUTIFUl BANARASI',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '.Explore',
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

  Widget _buildShopByFabric() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return ClipOval(
            child: Image.network(
              "https://placeimg.com/868/430/fabric",
              fit: BoxFit.cover,
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

  Widget _buildUnstitched() {
    return CarouselSlider(
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
                  color: Colors.transparent,
                  // decoration: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //     colors: [],
                  //     begin: Alignment.bottomCenter,
                  //     end: Alignment.topCenter,
                  //   ),
                  // ),
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
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          initialPage: 2,
          // enableInfiniteScroll: false
        ));
  }
}
