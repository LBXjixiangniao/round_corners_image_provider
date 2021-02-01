library round_corners_image_provider;

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:flutter/src/painting/_network_image_io.dart' if (dart.library.html) 'package:flutter/src/painting/_network_image_web.dart' as network_image;
// ignore: implementation_imports
import 'package:cached_network_image/src/image_provider/_image_provider_io.dart' if (dart.library.html) 'package:cached_network_image/src/image_provider/_image_provider_web.dart'
    as CachedNetworkImage;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

part 'isolate.dart';
part 'image_provider.dart';