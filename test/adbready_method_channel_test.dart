import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adbready/adbready_method_channel.dart';

void main() {
  MethodChannelAdbready platform = MethodChannelAdbready();
  const MethodChannel channel = MethodChannel('adbready');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('deploy', () async {
    expect(await platform.deploy(), '42');
  });
}
