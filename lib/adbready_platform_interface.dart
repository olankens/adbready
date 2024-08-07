import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'adbready_method_channel.dart';

abstract class AdbreadyPlatform extends PlatformInterface {
  AdbreadyPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdbreadyPlatform _instance = MethodChannelAdbready();

  static AdbreadyPlatform get instance => _instance;

  static set instance(AdbreadyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> deploy() {
    throw UnimplementedError('deploy() has not been implemented.');
  }
}
