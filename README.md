# round_corners_image_provider

一个ImageProvider封装，用于生成圆角图片。分别继承ExactAssetImage、AssetImage、FileImage、MemoryImage、NetworkImage和CachedNetworkImageProvider实现了圆角ImageProvider。

CachedNetworkImageProvider为`cached_network_image`包提供的ImageProvider

## 用法

```
Image(
    image: RoundCornersImageProvider.asset(
        'assets/icon_round_corners.png',
        cornerRadius: 30,
        imageShowSize: Size(60, 60),
        cornerColor: Colors.yellow
    ),
    width: 60,
    height: 60,
),
```
### 相对与原有ImageProvider增加的属性及其作用
```
///圆角，如果imageShowSize不为空，则通过计算使得以imageShowSize显示出来的图片圆角为cornerRadius，
  ///如果imageShowSize为空，而cacheImageWidth或者cacheImageHeight不为空，则将resize之后的图片圆角设置为cornerRadius
  ///如果imageShowSize、cacheImageWidth、cacheImageHeight都为空，则将原图圆角设置为cornerRadius
  final int cornerRadius;
  //cornerRadius圆角外围部分的颜色，则被裁剪掉部分颜色
  final Color cornerColor;
  //ImageCache缓存图片的宽高设置
  final int cacheImageWidth;
  final int cacheImageHeight;

  //imageShowSize设置后裁取的位置
  //如果设置ClipLocation.Start，则当原始图片过长的时候从头部(上或左)截取宽高比为imageShowSize框高比的图片。
  final ClipLocation clipLocation;

  //图片显示的大小。如果设置了图片显示宽高，会按图片显示宽高比截取原图。圆角也会匹配imageShowSize
  final Size imageShowSize;
```

## 效果
由以下对比图可知，cpu和gpu新能都有一定提高

以下截图gpu和cpu数据为不断刷新页面得到的截图。

用ClipRRect显示圆角效果
![](./read_me_image/clip.jpg)
使用RoundCornersImageProvider.asset生成圆角图片效果
![](./read_me_image/round.jpg)