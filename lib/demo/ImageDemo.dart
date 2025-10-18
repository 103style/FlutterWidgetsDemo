import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/base/BasePage.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/10/17 16:30
 * supoort formats : JPEG、JPG、GIF、WebP、BMP、WBMP
 */
final pic1 =
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";
final pic2 =
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg";

class ImageDemo extends BasePage {
  const ImageDemo({super.key, required super.title});

  @override
  Widget content(BuildContext context) {
    return ListView(
      children: [
        // icon
        _buildIcon(),

        Text("Image、Image.asset、Image.network、NetworkImage:"),
        // 本地图片，
        _buildImageContainer(Image.asset("assets/images/pic1.jpg")),

        // // 本地图片， 本地文件目录
        // _buildImageContainer(Image.file(File("/Download/pic1.jpg"))),

        // 网络图片
        _buildImageContainer(
          Image.network(pic1, fit: BoxFit.contain, semanticLabel: "网络图片"),
        ),

        // 网络图片，带loading状态
        _buildImageContainer(
          Image(
            image: NetworkImage(pic2),
            // Widget Function(BuildContext context, Widget child, ImageChunkEvent? loadingProgress);
            loadingBuilder: (context, child, loadingProgress) {
              return loadingProgress == null
                  ? child
                  : CircularProgressIndicator();
            },
          ),
        ),

        Text("FadeInImage:"),
        // FadeInImage
        _buildImageContainer(
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.jpeg",
            image: pic2,
          ),
        ),
        _buildImageContainer(
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.jpeg",
            // 占位符颜色
            placeholderColor: Colors.pinkAccent,
            // 占位符颜色混合模式
            placeholderColorBlendMode: BlendMode.darken,
            image: pic2,
          ),
        ),
        _buildImageContainer(
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.jpeg",
            image: pic2,
            // 淡入动画的持续时间
            fadeInDuration: const Duration(seconds: 1),
            // 图像淡入动画的曲线
            fadeInCurve: Curves.bounceIn,
            // 淡出动画的持续时间
            fadeOutDuration: const Duration(seconds: 1),
            // 图像淡出动画的曲线
            fadeOutCurve: Curves.easeInOut,
          ),
        ),
      ],
    );
  }

  Widget _buildImageContainer(Widget content) {
    return Container(
      height: 100,
      padding: EdgeInsetsDirectional.all(4),
      child: content,
    );
  }

  Widget _buildIcon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Icon、IconButton、Ink:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 24.0),
            Icon(
              Icons.add,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: "a add icon",
            ),
            IconButton(
              onPressed: () => print("on click audiotrack"),
              icon: Icon(Icons.audiotrack, color: Colors.green, size: 24.0),
            ),

            Ink(
              decoration: const ShapeDecoration(
                color: Colors.red,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.audiotrack),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
