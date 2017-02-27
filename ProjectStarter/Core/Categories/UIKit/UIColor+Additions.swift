//
//  UIColor+Additions.swift
//  feminalink
//
//  Created by Lana on 02/12/16.
//  Copyright © 2016 vo2. All rights reserved.
//

import UIKit

public enum UIColorInputError : Error {
    case missingHashMarkAsPrefix
    case unableToScanHexValue
    case mismatchedHexStringLength
}

public extension UIColor {

    public static func color(hex: String) -> UIColor {
        return UIColor(hex: hex)
    }

    public convenience init(hex: String) {

        guard let color = try? UIColor(hex: hex, alpha: 1.0) else {
            self.init(cgColor: UIColor.clear.cgColor)

            return;
        }

        self.init(cgColor: color.cgColor)
    }

    public convenience init(hex: String, alpha:Float) throws {

        guard hex.characters.count == 7 else {
            throw UIColorInputError.mismatchedHexStringLength
        }

        guard hex.hasPrefix("#") else {
            throw UIColorInputError.missingHashMarkAsPrefix
        }

        let hexString = hex.substring(from: hex.characters.index(after: hex.startIndex))
        let divisor = CGFloat(255)


        var hexValue: UInt32 = 0

        guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
            throw UIColorInputError.unableToScanHexValue
        }

        let red = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hexValue & 0x00FF00) >>  8) / divisor
        let blue = CGFloat(hexValue & 0x0000FF) / divisor

        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }

}
