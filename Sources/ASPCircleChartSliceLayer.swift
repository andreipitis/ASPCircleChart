//
//  CircleChartSliceLayer.swift
//  ASPCircleChart
//
//  Created by Andrei-Sergiu Pițiș on 15/06/16.
//  Copyright © 2016 Andrei-Sergiu Pițiș. All rights reserved.
//

import UIKit

/**
Custom layer that draws a slice of a circle.
*/
open class ASPCircleChartSliceLayer: CALayer {
	/**
	The start angle in radians of the slice.
	*/
	@NSManaged open var startAngle: CGFloat
	
	/**
	The end angle in radians of the slice.
	*/
	@NSManaged open var endAngle: CGFloat
	
	/**
	The color of the slice.
	*/
	open var strokeColor: UIColor = UIColor.black
	/**
	The width of the slice. Default value is 10.0.
	*/
	open var strokeWidth: CGFloat = 10.0
	
	/**
	The duration of the slice animation. Default value is 0.35.
	*/
	open var animationDuration: Double = 0.35
	
	/**
	The value that will be subtracted from the slice radius.
	*/
	open var radiusOffset: CGFloat = 0.0
	
	/**
	The cap style of the slice.
	*/
	open var lineCapStyle: CGLineCap = .butt
	
	public override init() {
		super.init()
		contentsScale = UIScreen.main.scale
	}
	
	public override init(layer: Any) {
		super.init(layer: layer)
		contentsScale = UIScreen.main.scale
		
		if let layer = layer as? ASPCircleChartSliceLayer {
			startAngle = layer.startAngle
			endAngle = layer.endAngle
			strokeColor = layer.strokeColor
			strokeWidth = layer.strokeWidth
			lineCapStyle = layer.lineCapStyle
			animationDuration = layer.animationDuration
			radiusOffset = layer.radiusOffset
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	open override func draw(in ctx: CGContext) {
		super.draw(in: ctx)
		
		UIGraphicsPushContext(ctx)
		
		let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
		let radius = min(centerPoint.x, centerPoint.y) - (strokeWidth / 2.0) - radiusOffset
		
		let bezierPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
		
		strokeColor.setStroke()
		
		bezierPath.lineWidth = strokeWidth
		bezierPath.lineCapStyle = lineCapStyle
		bezierPath.stroke()
		
		UIGraphicsPopContext()
		
	}
	
	open override func action(forKey event: String) -> CAAction? {
		if event == "startAngle" || event == "endAngle" {
			let basicAnimation = CABasicAnimation(keyPath: event)
			basicAnimation.fromValue = presentation()?.value(forKey: event)
            basicAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
			basicAnimation.duration = animationDuration
			
			return basicAnimation
		}
		
		return super.action(forKey: event)
	}
	
	open override class func needsDisplay(forKey key: String) -> Bool {
		if key == "startAngle" || key == "endAngle" {
			return true
		}
		
		return super.needsDisplay(forKey: key)
	}
}
