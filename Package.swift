// swift-tools-version: 5.5
//
//  KSAppleDeviceNames
//
//  Mapping device IDs to Apple device models.
//  https://github.com/svkrasavin/KSAppleDeviceNames.git
//
//  MIT License
//
//  Copyright (c) 2024 Sergey Krasavin <krasavin.sergey@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import PackageDescription

let package = Package(
    name: "KSAppleDeviceNames",
    products: [
        .library(
            name: "KSAppleDeviceNames",
            targets: ["KSAppleDeviceNames"]
        ),
    ],
    dependencies: [ 
    ],
    targets: [
        .target(
            name: "KSAppleDeviceNames",
            resources: [.process("PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "KSAppleDeviceNamesTests",
            dependencies: ["KSAppleDeviceNames"]
        ),
    ]
)
