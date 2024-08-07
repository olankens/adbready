import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adbready_platform_interface.dart';

class MethodChannelAdbready extends AdbreadyPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('adbready');

  @override
  Future<String> deploy() async {
    return await methodChannel.invokeMethod<String>('deploy') ?? '';
  }
}
