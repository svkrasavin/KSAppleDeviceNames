//
//  UIDevice.swift
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

import SystemConfiguration
import UIKit

public extension UIDevice {
    
    /// The name of the Apple device model
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String {
#if os(iOS)
            switch identifier {
                case "iPod1,1": return "iPod touch"
                case "iPod2,1": return "iPod touch 2"
                case "iPod3,1": return "iPod touch 3"
                case "iPod4,1": return "iPod touch 4"
                case "iPod5,1": return "iPod touch 5"
                case "iPod7,1": return "iPod touch 6"
                case "iPod9,1": return "iPod touch 7"
                    
                case "iPhone1,1":                           return "iPhone"
                case "iPhone1,2":                           return "iPhone 3G"
                case "iPhone2,1":                           return "iPhone 3GS"
                case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
                case "iPhone4,1", "iPhone4,2", "iPhone4,3": return "iPhone 4S"
                case "iPhone5,1", "iPhone5,2":              return "iPhone 5"
                case "iPhone5,3", "iPhone5,4":              return "iPhone 5C"
                case "iPhone6,1", "iPhone6,2":              return "iPhone 5S"
                case "iPhone7,2":                           return "iPhone 6"
                case "iPhone7,1":                           return "iPhone 6 Plus"
                case "iPhone8,1":                           return "iPhone 6S"
                case "iPhone8,2":                           return "iPhone 6S Plus"
                case "iPhone8,4":                           return "iPhone SE"
                case "iPhone9,1", "iPhone9,3":              return "iPhone 7"
                case "iPhone9,2", "iPhone9,4":              return "iPhone 7 Plus"
                case "iPhone10,1", "iPhone10,4":            return "iPhone 8"
                case "iPhone10,2", "iPhone10,5":            return "iPhone 8 Plus"
                case "iPhone10,3", "iPhone10,6":            return "iPhone X"
                case "iPhone11,2":                          return "iPhone XS"
                case "iPhone11,4", "iPhone11,6":            return "iPhone XS Max"
                case "iPhone11,8":                          return "iPhone XR"
                case "iPhone12,1":                          return "iPhone 11"
                case "iPhone12,3":                          return "iPhone 11 Pro"
                case "iPhone12,5":                          return "iPhone 11 Pro Max"
                case "iPhone12,8":                          return "iPhone SE 2"
                case "iPhone13,1":                          return "iPhone 12 mini"
                case "iPhone13,2":                          return "iPhone 12"
                case "iPhone13,3":                          return "iPhone 12 Pro"
                case "iPhone13,4":                          return "iPhone 12 Pro Max"
                case "iPhone14,2":                          return "iPhone 13 Pro"
                case "iPhone14,3":                          return "iPhone 13 Pro Max"
                case "iPhone14,4":                          return "iPhone 13 Mini"
                case "iPhone14,5":                          return "iPhone 13"
                case "iPhone14,6":                          return "iPhone SE 3"
                case "iPhone14,7":                          return "iPhone 14"
                case "iPhone14,8":                          return "iPhone 14 Plus"
                case "iPhone15,2":                          return "iPhone 14 Pro"
                case "iPhone15,3":                          return "iPhone 14 Pro Max"
                case "iPhone15,4":                          return "iPhone 15"
                case "iPhone15,5":                          return "iPhone 15 Plus"
                case "iPhone16,1":                          return "iPhone 15 Pro"
                case "iPhone16,2":                          return "iPhone 15 Pro Max"
                case "iPhone17,3":                          return "iPhone 16"
                case "iPhone17,4":                          return "iPhone 16 Plus"
                case "iPhone17,1":                          return "iPhone 16 Pro"
                case "iPhone17,2":                          return "iPhone 16 Pro Max"
                case "iPhone17,5":                          return "iPhone 16e"
                    
                case "iPad1,1":                                         return "iPad"
                case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":        return "iPad 2"
                case "iPad3,1", "iPad3,2", "iPad3,3":                   return "iPad 3"
                case "iPad3,4", "iPad3,5", "iPad3,6":                   return "iPad 4"
                case "iPad6,11", "iPad6,12":                            return "iPad 5"
                case "iPad7,5", "iPad7,6":                              return "iPad 6"
                case "iPad7,11", "iPad7,12":                            return "iPad 7"
                case "iPad11,6", "iPad11,7":                            return "iPad 8"
                case "iPad12,1", "iPad12,2":                            return "iPad 9"
                case "iPad13,18", "iPad13,19":                          return "iPad 10"
                    
                case "iPad4,1", "iPad4,2", "iPad4,3":                   return "iPad Air"
                case "iPad5,3", "iPad5,4":                              return "iPad Air 2"
                case "iPad11,3", "iPad11,4":                            return "iPad Air 3"
                case "iPad13,1", "iPad13,2":                            return "iPad Air 4"
                case "iPad13,16", "iPad13,17":                          return "iPad Air 5"
                case "iPad14,8", "iPad14,9":                            return "iPad Air 11-inch (M2)"
                case "iPad14,10", "iPad14,11":                          return "iPad Air 13-inch (M2)"
                    
                case "iPad2,5", "iPad2,6", "iPad2,7":                   return "iPad mini"
                case "iPad4,4", "iPad4,5", "iPad4,6":                   return "iPad mini 2"
                case "iPad4,7", "iPad4,8", "iPad4,9":                   return "iPad mini 3"
                case "iPad5,1", "iPad5,2":                              return "iPad mini 4"
                case "iPad11,1", "iPad11,2":                            return "iPad mini 5"
                case "iPad14,1", "iPad14,2":                            return "iPad mini 6"
                case "iPad16,1", "iPad16,2":                            return "iPad mini (A17 Pro)"
                    
                case "iPad6,3", "iPad6,4":                              return "iPad Pro (9.7-inch)"
                case "iPad7,3", "iPad7,4":                              return "iPad Pro (10.5-inch)"
                case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":        return "iPad Pro (11-inch)"
                case "iPad8,9", "iPad8,10":                             return "iPad Pro 2 (11-inch)"
                case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7":    return "iPad Pro 3 (11-inch)"
                case "iPad14,3", "iPad14,4":                            return "iPad Pro 4 (11-inch, M2)"
                case "iPad16,3", "iPad16,4":                            return "iPad Pro 5 (11-inch, M4)"
                case "iPad6,7", "iPad6,8":                              return "iPad Pro (12.9-inch)"
                case "iPad7,1", "iPad7,2":                              return "iPad Pro 2 (12.9-inch)"
                case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":        return "iPad Pro 3 (12.9-inch)"
                case "iPad8,11", "iPad8,12":                            return "iPad Pro 4 (12.9-inch)"
                case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11":  return "iPad Pro 5 (12.9-inch)"
                case "iPad14,5", "iPad14,6":                            return "iPad Pro 6 (12.9-inch)"
                case "iPad16,5", "iPad16,6":                            return "iPad Pro 7 (13-inch, M4)"
                    
                case "AppleTV1,1":                  return "Apple TV 1"
                case "AppleTV2,1":                  return "Apple TV 2"
                case "AppleTV3,1", "AppleTV3,2":    return "Apple TV 3"
                    
                case "AudioAccessory1,1":   return "HomePod"
                case "AudioAccessory5,1":   return "HomePod mini"
                    
                case "Watch1,1", "Watch1,2":                                return "Apple Watch"
                case "Watch2,6", "Watch2,7":                                return "Apple Watch Series 1"
                case "Watch2,3", "Watch2,4":                                return "Apple Watch Series 2"
                case "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4":        return "Apple Watch Series 3"
                case "Watch4,1", "Watch4,2", "Watch4,3", "Watch4,4":        return "Apple Watch Series 4"
                case "Watch5,1", "Watch5,2", "Watch5,3", "Watch5,4":        return "Apple Watch Series 5"
                case "Watch5,9", "Watch5,10", "Watch5,11", "Watch5,12":     return "Apple Watch SE"
                case "Watch6,1", "Watch6,2", "Watch6,3", "Watch6,4":        return "Apple Watch Series 6"
                case "Watch6,6", "Watch6,7", "Watch6,8", "Watch6,9":        return "Apple Watch Series 7"
                case "Watch6,10", "Watch6,11", "Watch6,12", "Watch6,13":    return "Apple Watch SE 2"
                case "Watch6,14", "Watch6,15", "Watch6,16", "Watch6,17":    return "Apple Watch Series 8"
                case "Watch6,18":                                           return "Apple Watch Ultra"
                case "Watch7,1", "Watch7,2", "Watch7,3", "Watch7,4":        return "Apple Watch Series 9"
                case "Watch7,5":                                            return "Apple Watch Ultra 2"
                case "Watch7,8", "Watch7,9", "Watch7,10", "Watch7,11":      return "Apple Watch Series 10"
                    
                case "i386", "x86_64", "arm64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
                default:    return identifier
            }
#elseif os(tvOS)
            switch identifier {
                    
                case "AppleTV5,3":      return "Apple TV 4"
                case "AppleTV6,2":      return "Apple TV 4K"
                case "AppleTV11,1":     return "Apple TV 4K 2"
                case "AppleTV14,1":     return "Apple TV 4K 3"
                    
                case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
                default: return identifier
            }
#endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
}
