//
//  Math.swift
//  Bandit
//
//  Created by Andrei-Sergiu Pițiș on 05/02/16.
//  Copyright © 2016 Andrei-Sergiu Pițiș. All rights reserved.
//

import Foundation
import UIKit

public protocol NumericType {
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    func %(lhs: Self, rhs: Self) -> Self
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

//MARK: - Math interpolation methods -

public func lerp<T: NumericType>(from: T, to: T, step: T) -> T {
    return from + step * (to - from)
}

//MARK: - Math mapping functions -

public func rangeMap<T: NumericType>(value: T, min: T, max: T, newMin: T, newMax: T) -> T {
    return (((value - min) * (newMax - newMin)) / (max - min)) + newMin
}

//MARK: - Numeric extensions -

public func *(left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.height * right, height: left.width * right)
}

