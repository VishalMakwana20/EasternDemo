import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/const_color.dart';

/// To show SVG Asset Image

class ShowImage extends StatelessWidget {
  const ShowImage(
      {Key? key,
      required this.imagePath,
      this.width,
      this.height,
      this.color,
      this.fit,
      this.borderRadius = 0})
      : super(key: key);

  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: _setImage(),
    );
  }

  Widget _setImage() {
    if (imagePath.contains('http')) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        // cacheManager: CacheManager(
        //   Config(
        //     'key',
        //     stalePeriod: const Duration(seconds: 1),
        //     maxNrOfCacheObjects: 20,
        //     // repo: JsonCacheInfoRepository(databaseName: key),

        //     // fileSystem: IOFileSystem(key),

        //     fileService: HttpFileService(),
        //   ),
        // ),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
        height: height,
        width: width,
        color: color,
        fit: fit ?? BoxFit.contain,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: ConstColor.gray200,
          highlightColor: ConstColor.gray200.withOpacity(0.9),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          child: Icon(
            Icons.person,
            color: ConstColor.white,
          ),
        ),
      );
    } else if (imagePath.contains('svg')) {
      return SvgPicture.asset(
        imagePath,
        height: height,
        width: width,
        color: color,
        fit: fit ?? BoxFit.contain,
      );
    } else {
      if (imagePath.contains('assets')) {
        return Image.asset(
          imagePath,
          height: height,
          width: width,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
      } else {
        if (imagePath.contains('image_profile_url')) {
          return Container(
            height: height,
            width: width,
            color: ConstColor.gray200,
            child: Icon(Icons.person),
          );
        } else if (imagePath == '') {
          return Container(
            height: height,
            width: width,
            color: ConstColor.gray200,
            child: Icon(Icons.person),
          );
        } else {
          return Image.file(
            File(imagePath),
            height: height,
            width: width,
            color: color,
            fit: fit ?? BoxFit.contain,
          );
        }
      }
    }
  }
}
