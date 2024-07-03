# KSAppleDeviceNames

![GitHub Release](https://img.shields.io/github/v/release/svkrasavin/KSAppleDeviceNames)
![GitHub Release Date](https://img.shields.io/github/release-date/svkrasavin/KSAppleDeviceNames)
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/) 

Mapping device IDs to Apple device models.

An extension of the UIDevice class that returns the Apple device model name based on the internal device identifier (e.g., `iPhone10,4` -> `iPhone 8` or `iPad16,4` -> `iPad Pro 5 (11-inch, M4)`).

You can simply insert the extension text from the `UIDevice+modelName.swift` file into your project, or use the Swift Package Manager to add the dependency to your project.

## Swift Package Manager Install

```swift
  dependencies: [
    .package(url: "https://github.com/svkrasavin/KSAppleDeviceNames.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage/Examples

```swift
import KSAppleDeviceNames
...
let modelName = UIDevice.modelName
```

## Data

Based on data from:

* [Models - The Apple Wiki](https://theapplewiki.com/wiki/Models)
* [EveryiPhone.com](https://everymac.com/systems/apple/iphone/index-iphone-specs.html)
* [EveryMac.com](https://everymac.com)

## Author

- [Sergey Krasavin](https://www.github.com/svkrasavin), <krasavin.sergey@gmail.com>

## Contributing

Contributions are always welcome!
