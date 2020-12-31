import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FlutterWebBrowser.openWebPage(
            url: this.url,
            customTabsOptions: CustomTabsOptions(
                colorScheme: CustomTabsColorScheme.dark,
                toolbarColor: Colors.blue,
                secondaryToolbarColor: Colors.white,
                addDefaultShareMenuItem: true,
                instantAppsEnabled: true,
                showTitle: true,
                urlBarHidingEnabled: true));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: this.imageUrl,
                  errorWidget: (context, url, error) {
                    return Image.network(
                        "https://poshet.com.tr/wp-content/uploads/2020/02/placeholder-600x400.png");
                  },
                )),
            SizedBox(
              height: 8,
            ),
            Text(this.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 8,
            ),
            Text(
              this.description.replaceAll("\\", ""),
            ),
          ],
        ),
      ),
    );
  }
}
