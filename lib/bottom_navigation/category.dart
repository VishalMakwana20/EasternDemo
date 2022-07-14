import 'package:eastern_demo/constant/const_image.dart';
import 'package:eastern_demo/model/category_model.dart';
import 'package:eastern_demo/widget/show_image.dart';
import 'package:flutter/material.dart';

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
                  return Column(
                    children: [
                      ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const Divider(
                                  height: 1,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                        "https://placeimg.com/868/430/fabric"),
                                    fit: BoxFit.cover,
                                  )),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: SizedBox.expand(
                                    child: Text(list[index].categoryName!),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                ),
                              ],
                            );
                          })
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
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ShowImage(
            imagePath: ConstImage.leftBack,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              child: Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          )),
          const ShowImage(
            imagePath: ConstImage.search,
          ),
          const SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              const ShowImage(
                imagePath: ConstImage.shopping,
                height: 24,
                width: 24,
              ),
              Positioned(
                  right: 0,
                  top: 0,
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
          )
        ],
      ),
    );
  }
}
