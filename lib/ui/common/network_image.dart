import 'package:cached_network_image/cached_network_image.dart';
import 'package:coronavirus_stats_app/di/main_component.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double width;

  const CustomNetworkImage({Key key, @required this.url, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = MainComponent.instance.client;
    if (client == Client.MOBILE)
      return CachedNetworkImage(
        width: width,
        imageUrl: url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    else
      return Image.network(
        url,
        width: width,
      );
  }
}
