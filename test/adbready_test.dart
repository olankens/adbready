import 'package:flutter_test/flutter_test.dart';
import 'package:adbready/adbready.dart';
import 'package:adbready/adbready_platform_interface.dart';
import 'package:adbready/adbready_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdbreadyPlatform with MockPlatformInterfaceMixin implements AdbreadyPlatform {
  @override
  Future<String> deploy() => Future.value('42');
}

void main() {
  final AdbreadyPlatform initialPlatform = AdbreadyPlatform.instance;

  test('$MethodChannelAdbready is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdbready>());
  });

  test('getPlatformVersion', () async {
    Adbready adbreadyPlugin = Adbready();
    MockAdbreadyPlatform fakePlatform = MockAdbreadyPlatform();
    AdbreadyPlatform.instance = fakePlatform;
    expect(await adbreadyPlugin.deploy(), '42');
  });
}
