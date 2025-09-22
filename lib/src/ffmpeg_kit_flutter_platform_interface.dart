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

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ffmpeg_kit_flutter_method_channel.dart';

/// The interface that implementations of ffmpeg_kit_flutter must implement.
///
/// Platform implementations should extend this class rather than implement it as `ffmpeg_kit_flutter`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [FFmpegKitPlatform] methods.
abstract class FFmpegKitPlatform extends PlatformInterface {
  /// Constructs a FFmpegKitPlatform.
  FFmpegKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FFmpegKitPlatform _instance = FFmpegKitMethodChannel();

  /// The default instance of [FFmpegKitPlatform] to use.
  ///
  /// Defaults to [FFmpegKitMethodChannel].
  static FFmpegKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FFmpegKitPlatform] when
  /// they register themselves.
  static set instance(FFmpegKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the log level.
  Future<int?> ffmpegKitFlutterInitializerGetLogLevel() {
    throw UnimplementedError('ffmpegKitFlutterInitializerGetLogLevel() has not been implemented.');
  }
}
