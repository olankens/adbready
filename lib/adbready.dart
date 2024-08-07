import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'adbready_platform_interface.dart';

class Adbready {
  Future<String> deploy() async {
    return await AdbreadyPlatform.instance.deploy();
  }

  Future<ProcessResult> invoke(List<String> command) async {
    return await Process.run(
      await deploy(),
      command,
      environment: {
        'HOME': (await getApplicationSupportDirectory()).path,
        'TMPDIR': (await getTemporaryDirectory()).path
      },
    );
  }
}
