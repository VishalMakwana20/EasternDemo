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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<List<Categories>>(
        stream: categoryBloc!.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                              height: 150,
                              child: SizedBox.expand(),
                            ),
                            const Divider(
                              height: 1,
                            ),
                          ],
                        );
                      }),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: const CircularProgressIndicator());
        });
  }
}
