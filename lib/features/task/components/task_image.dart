import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TaskImage extends StatelessWidget {
  final String image;
  const TaskImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade100, width: 2),
          borderRadius: BorderRadius.circular(AppSizes.s05),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(.08),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
