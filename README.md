# <samp>OVERVIEW</samp>

ADB binaries ready for Android as a Flutter library.  
Execute any ADB commands directly **from your Android device**.

| <samp>AND</samp> | <samp>IOS</samp> | <samp>LIN</samp> | <samp>MAC</samp> | <samp>WIN</samp> | <samp>WEB</samp> |
| :-: | :-: | :-: | :-: | :-: | :-: |
| <br>🟩<br><br> | <br>🟥<br><br> | <br>🟥<br><br> | <br>🟥<br><br> | <br>🟥<br><br> | <br>🟥<br><br> |

# <samp>GUIDANCE</samp>

### Update from repository

```shell
flutter pub add adbready --git-url https://github.com/olankens/adbready
```

### Gather executable path

```dart
final starter = await Adbready().deploy();
```

### Invoke command to target

```dart
final address = '192.168.1.10';
final command = ['-s', address, 'shell', 'getprop ro.product.model'];
final process = await Adbready().invoke(command)
final product = process.stdout;
```
