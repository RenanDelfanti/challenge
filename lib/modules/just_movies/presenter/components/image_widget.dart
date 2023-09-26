import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';

import '../../../../_exports.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.path,
    this.height = 0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  final String path;
  final double height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: NetworkImage(
            '${GetIt.I<IConfigServer>().getConfigByEnv(key: ConfigServerConstants.imagesUrl)}$path',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
