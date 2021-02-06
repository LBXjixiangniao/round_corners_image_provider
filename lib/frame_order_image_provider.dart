part of 'round_corners_image_provider.dart';

class _FrameOrderKey {
  const _FrameOrderKey(this.providerKey);

  final Object providerKey;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _FrameOrderKey && other.providerKey == providerKey;
  }

  @override
  int get hashCode => providerKey.hashCode;
}

class FrameOrderImageStreamCompleter extends ImageStreamCompleter {
  final ImageStreamCompleter _imageStreamCompleter;

  FrameOrderImageStreamCompleter(this._imageStreamCompleter) : assert(_imageStreamCompleter != null) {
    _imageStreamCompleter.addListener(
      ImageStreamListener(
          (imageInfo, b) {
            setImage(imageInfo);
          },
          onChunk: reportImageChunkEvent,
          onError: (exception, stackTrace) {
            reportError(
              context: ErrorDescription('error for FrameOrderImageStreamCompleter'),
              exception: exception,
              stack: stackTrace,
            );
          }),
    );
  }
}

class FrameOrderImage extends ImageProvider<_FrameOrderKey> {
  const FrameOrderImage(this.imageProvider);

  /// The [ImageProvider] that this class wraps.
  final ImageProvider imageProvider;

  @override
  ImageStreamCompleter load(_FrameOrderKey key, DecoderCallback decode) {
    return FrameOrderImageStreamCompleter(imageProvider.load(key.providerKey, decode));
  }

  @override
  Future<_FrameOrderKey> obtainKey(ImageConfiguration configuration) {
    Completer<_FrameOrderKey> completer;
    // If the imageProvider.obtainKey future is synchronous, then we will be able to fill in result with
    // a value before completer is initialized below.
    SynchronousFuture<_FrameOrderKey> result;
    imageProvider.obtainKey(configuration).then((Object key) {
      if (completer == null) {
        // This future has completed synchronously (completer was never assigned),
        // so we can directly create the synchronous result to return.
        result = SynchronousFuture<_FrameOrderKey>(_FrameOrderKey(key));
      } else {
        // This future did not synchronously complete.
        completer.complete(_FrameOrderKey(key));
      }
    });
    if (result != null) {
      return result;
    }
    // If the code reaches here, it means the imageProvider.obtainKey was not
    // completed sync, so we initialize the completer for completion later.
    completer = Completer<_FrameOrderKey>();
    return completer.future;
  }
}
