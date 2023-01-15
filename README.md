<h1 align="center">QR Stringify</h1>
<p align="center">  
<a href="https://github.com/yardexx/qr_stringify/actions/workflows/qr_drawer_workflow.yaml"><img src="https://github.com/yardexx/qr_stringify/actions/workflows/qr_drawer_workflow.yaml/badge.svg"/></a>  
<a href="https://codecov.io/gh/yardexx/qr_stringify"><img src="https://codecov.io/gh/yardexx/qr_stringify/branch/master/graph/badge.svg?token=6q00IsWQJG"/></a>  
<a href="https://pub.dev/packages/very_good_analysis"><img src="https://img.shields.io/badge/style-very_good_analysis-B22C89.svg" alt="style: very good analysis"></a>  
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>  
</p>

<p align="center">  Small package to generate QR codes that can be used in terminal output.</p>

<p align="center">  💙 Powered by Very Good Tools 💙  </p>

> 🚧 Public API of this package is **NOT STABLE**. 🚧
>
> [As version suggests](https://semver.org/#spec-item-4), QR Stringify shouldn't be used in production! More about semantic versioning [here](https://semver.org/).

### Simple 🎈

Easy to use. Simply create QR builder and provide data. Additionally, you can adjust padding and 
correction levels.

### Flexible 💃

You can extend `QrDrawer` class and make custom implementation for drawing QR code.

## Usage 🛠

### Creating QR Code 👷‍♂️
To generate code, create instance of `QrBuilder` and provide `data` which you want to encode into QR
Code. When you are satisfied with your settings, call `build()` to return QR code in form of `String`.

```dart
import 'package:qr_stringify/qr_stringify.dart';

// Creating builder
final builder = QrBuilder(data: 'Hello World');

// Building QR code
final code = builder.build();
```

> 💡 `QrBuilder` currently defaults to *utf8* drawer, which means, that QR code is generated using this charset. ASCII support is planned.

### Adding padding 🔳

If you wish to add more space around code (also called [quiet zone](https://www.marson.com.tw/en/faq/show.php?num=41)), 
you can do so by adding padding.

```dart
final builder = QrBuilder(data: 'Hello World')
  ..padding = 1;

// QR code with padding
final code = builder.build();
```

### Error correction level 🔧

QR code can be generated with different levels of error corrections levels. These determine how much
damage can QR code sustain before being unreadable.

Higher level means higher percentage of code can be damaged. In `qr_stringify`, these value are 
represented as `ErrorCorrectionLevel` with respective values:
- ErrorCorrectionLevel.L - up to 7% damage
- ErrorCorrectionLevel.M - up to 15% damage
- ErrorCorrectionLevel.Q - up to 25% damage
- ErrorCorrectionLevel.H - up to 30% damage

`QrBuilder` default value is `ErrorCorrectionLevel.L`.
You can choose other values by passing them in builder.

```dart
final builder = QrBuilder(data: 'Hello World')
  ..correctionLevel = ErrorCorrectionLevel.L;
```

> ❗ Be aware that higher level of correction will result in bigger code.

More about error correction in QR codes [here](https://blog.qrstuff.com/general/qr-code-error-correction).

## Planned features 🗺
- ASCII support
- Borders
- Colors (ANSI)
- Title texts with links

## Contribution 🤝
For issues, bugs, or feature proposals feel free to [open issue](https://github.com/yardexx/qr_stringify/issues) 
or [create PR](https://github.com/yardexx/qr_stringify/pulls).