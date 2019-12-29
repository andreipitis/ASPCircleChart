//
//  Math.swift
//  Bandit
//
//  Created by Andrei-Sergiu Pițiș on 05/02/16.
//  Copyright © 2016 Andrei-Sergiu Pițiș. All rights reserved.
//

import Foundation
import UIKit

internal protocol NumericType {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    init(_ v: Int)
}

extension Double : NumericType { }
extension Float  : NumericType { }
extension Int    : NumericType { }
extension Int8   : NumericType { }
extension Int16  : NumericType { }
extension Int32  : NumericType { }
extension Int64  : NumericType { }
extension UInt   : NumericType { }
extension UInt8  : NumericType { }
extension UInt16 : NumericType { }
extension UInt32 : NumericType { }
extension UInt64 : NumericType { }
extension CGFloat : NumericType { }

//MARK: - Math mapping functions -

/**
	Maps the value from one range to another.
	- Parameter value: The value to be mapped.
	- Parameter min: The minimum value of the current range.
	- Parameter max: The maximum value of the current range.
	- Parameter newMin: The minimum value of the new range.
	- Parameter newMax: The maximum value of the new range.
	- Ex. `value = 50.0, min = 0.0, max = 100.0, newMin = 0.0, newMax = 1.0 => newValue = 0.5`
*/
internal func rangeMap<T: NumericType>(_ value: T, min: T, max: T, newMin: T, newMax: T) -> T {
    return (((value - min) * (newMax - newMin)) / (max - min)) + newMin
}
