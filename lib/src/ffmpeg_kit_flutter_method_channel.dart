/*
 * Copyright (c) 2019-2021 Taner Sener
 *
 * This file is part of FFmpegKit.
 *
 * FFmpegKit is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FFmpegKit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FFmpegKit.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/services.dart';

import 'ffmpeg_kit_flutter_platform_interface.dart';

/// An implementation of [FFmpegKitPlatform] that uses method channels.
class FFmpegKitMethodChannel extends FFmpegKitPlatform {
  /// The method channel used to interact with the native platform.
  final MethodChannel _methodChannel = const MethodChannel('flutter.arthenica.com/ffmpeg_kit');

  @override
  Future<int?> ffmpegKitFlutterInitializerGetLogLevel() async {
    final int? logLevel = await _methodChannel.invokeMethod<int>('getLogLevel');
    return logLevel;
  }
}
