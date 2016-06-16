//
//  CircleChart.swift
//  ASPCircleChart
//
//  Created by Andrei-Sergiu Pițiș on 15/06/16.
//  Copyright © 2016 Andrei-Sergiu Pițiș. All rights reserved.
//

import UIKit

@objc public protocol ASPCircleChartDataSource {
	func numberOfDataPoints() -> Int
	func dataPointAtIndex(index: Int) -> Int
	func dataPointsSum() -> Int
	func colorForDataPointAtIndex(index: Int) -> UIColor
}

@IBDesignable
public class ASPCircleChart: UIView {
	
	public var initialAngle: CGFloat = 3.0 * CGFloat(M_PI_2)
	
	@IBInspectable public var circleWidth: CGFloat = 10.0
	@IBInspectable public var itemSpacing: CGFloat = 0.07 {
		didSet {
			itemSpacing = max(0.0, min(0.5, itemSpacing))
		}
	}
	
	@IBOutlet public var dataSource: ASPCircleChartDataSource? {
		didSet {
			reloadDataSource()
		}
	}
	
	private var startPoint: Int = 0
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		reloadDataSource()
	}
	
	public func reloadDataSource() {
		if let dataSource = dataSource {
			startPoint = 0
			var startAngle: CGFloat = initialAngle
			let maxPoint = dataSource.dataPointsSum()
			
			if var sublayers = layer.sublayers as? [ASPCircleChartSliceLayer] {
				if sublayers.count < dataSource.numberOfDataPoints() {
					for index in sublayers.count..<dataSource.numberOfDataPoints() {
						let slice = ASPCircleChartSliceLayer()
						slice.frame = bounds
						slice.strokeWidth = circleWidth
						slice.strokeColor = dataSource.colorForDataPointAtIndex(index)
						layer.addSublayer(slice)
						sublayers.append(slice)
					}
				}
				
				if sublayers.count > dataSource.numberOfDataPoints() {
					let count  = sublayers.count - dataSource.numberOfDataPoints()
					
					for _ in 0..<count {
						sublayers.last?.removeFromSuperlayer()
						sublayers.removeLast()
					}
				}
				
				for index in 0..<sublayers.count {
					let sublayer = sublayers[index]
					let dataPoint = dataSource.dataPointAtIndex(index)
					
					startPoint += dataPoint
					
					var endAngle: CGFloat = rangeMap(CGFloat(startPoint), min: 0.0, max: CGFloat(maxPoint), newMin: 0.0 + initialAngle, newMax: 2.0 * CGFloat(M_PI) + initialAngle)
					
					if endAngle - itemSpacing < startAngle && dataPoint > 0 {
						let tempAngle = endAngle - itemSpacing
						endAngle = startAngle
						startAngle = tempAngle
					} else if dataPoint > 0 {
						endAngle -= itemSpacing
					}
					
					if (startAngle != endAngle - itemSpacing) && dataPoint > 0 {
						sublayer.startAngle = startAngle
						sublayer.endAngle = endAngle
						sublayer.strokeWidth = circleWidth
						sublayer.strokeColor = dataSource.colorForDataPointAtIndex(index)
						
						startAngle = endAngle + itemSpacing
					} else {
						sublayer.startAngle = startAngle
						sublayer.endAngle = startAngle
						startAngle += itemSpacing
					}
				}
			} else {
				for index in 0..<dataSource.numberOfDataPoints() {
					let dataPoint = dataSource.dataPointAtIndex(index)
					startPoint += dataPoint
					
					var endAngle: CGFloat = rangeMap(CGFloat(startPoint), min: 0.0, max: CGFloat(maxPoint), newMin: 0.0 + initialAngle, newMax: 2.0 * CGFloat(M_PI) + initialAngle)
					
					if endAngle - itemSpacing < startAngle && dataPoint > 0 {
						let tempAngle = endAngle - itemSpacing
						endAngle = startAngle
						startAngle = tempAngle
					} else if dataPoint > 0 {
						endAngle -= itemSpacing
					}
					
					if (startAngle != endAngle - itemSpacing) && dataPoint > 0 {
						let slice = ASPCircleChartSliceLayer()
						slice.frame = bounds
						slice.startAngle = startAngle
						slice.endAngle = endAngle
						slice.strokeWidth = circleWidth
						slice.strokeColor = dataSource.colorForDataPointAtIndex(index)
						layer.addSublayer(slice)
						
						startAngle = endAngle + itemSpacing
					}
				}
			}
		}
	}
}