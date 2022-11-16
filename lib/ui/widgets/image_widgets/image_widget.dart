import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: FittedBox(
          fit: BoxFit.cover,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const SizedBox(
                width: 100,
                height: 100,
                child: Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFFD2EDF6),
                ))),
            errorWidget: (context, url, error) => SizedBox(
              width: 60,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.error),
                  Text(
                    "No se pudo Cargar la Imagen",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    /*return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),

          //Image.network(url),
        ),
      ),
    );*/
  }
}
