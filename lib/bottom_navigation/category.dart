import 'package:eastern_demo/constant/const_image.dart';
import 'package:eastern_demo/model/category_model.dart';
import 'package:eastern_demo/widget/show_image.dart';
import 'package:flutter/material.dart';
// import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import 'dart:math' as math;

import '../bloc/category_bloc.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

CategryBloc? categoryBloc;

class _CategoryState extends State<Category> {
  // List<String> list = [
  //   'Fabrics',
  //   'Curate your Design',
  //   'Boutique Collection',
  //   'Unstiched',
  //   'Upload your Design',
  //   'Fabric Book',
  //   'Sale'
  // ];

  @override
  void initState() {
    super.initState();
    categoryBloc = CategryBloc();
    categoryBloc!.fetchCategory();
  }

  @override
  void dispose() {
    categoryBloc!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Category'),
      // ),
      body: SafeArea(child: _buildBody()),
    );
  }

  List ls = [
    Colors.amber[200],
    Colors.blue[200],
    Colors.deepOrange[200],
    Colors.pinkAccent[200]
  ];

  Widget _buildBody() {
    return Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: StreamBuilder<List<Categories>>(
              stream: categoryBloc!.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var list = snapshot.data!;
                  Color color =
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
                  return Column(
                    children: [
                      ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(children: [
                                      const Spacer(),
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: color.withOpacity(0.7)),
                                    ]),
                                  ),
                                  Positioned(
                                    left: 1,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 30), // ***
                                        decoration: BoxDecoration(
                                          color: color.withOpacity(0.9),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                            )
                                          ],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.elliptical(
                                                      60, 100.0)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                  list[index].categoryName!)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 25,
                                    child: Image.network(
                                        "https://placeimg.com/868/430/fabric",
                                        height: 70,
                                        width: 100,
                                        fit: BoxFit.cover),
                                  )
                                ],
                              ),
                              const Divider(
                                height: 1,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
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
                imagePath: ConstImage.leftBack,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Category',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
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
}
