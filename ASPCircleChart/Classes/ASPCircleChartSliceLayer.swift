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
public class ASPCircleChartSliceLayer: CALayer {
	/**
	The start angle in radians of the slice.
	*/
	@NSManaged public var startAngle: CGFloat
	
	/**
	The end angle in radians of the slice.
	*/
	@NSManaged public var endAngle: CGFloat
	
	/**
	The color of the slice.
	*/
	public var strokeColor: UIColor = UIColor.blackColor()
	/**
	The width of the slice. Default value is 10.0.
	*/
	public var strokeWidth: CGFloat = 10.0
	
	/**
	The duration of the slice animation. Default value is 0.35.
	*/
	public var animationDuration: Double = 0.35
	
	/**
	The value that will be subtracted from the slice radius.
	*/
	public var radiusOffset: CGFloat = 0.0
	
	public override init() {
		super.init()
		contentsScale = UIScreen.mainScreen().scale
	}
	
	public override init(layer: AnyObject) {
		super.init(layer: layer)
		contentsScale = UIScreen.mainScreen().scale
		
		if layer is ASPCircleChartSliceLayer {
			startAngle = layer.startAngle
			endAngle = layer.endAngle
			strokeColor = layer.strokeColor
			strokeWidth = layer.strokeWidth
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func drawInContext(ctx: CGContext) {
		super.drawInContext(ctx)
		
		UIGraphicsPushContext(ctx)
		
		let centerPoint = CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds))
		let radius = min(centerPoint.x, centerPoint.y) - (strokeWidth / 2.0) - radiusOffset
		
		let bezierPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
		
		strokeColor.setStroke()
		
		bezierPath.lineWidth = strokeWidth
		bezierPath.stroke()
		
		UIGraphicsPopContext()
		
	}
	
	public override func actionForKey(event: String) -> CAAction? {
		if event == "startAngle" || event == "endAngle" {
			let basicAnimation = CABasicAnimation(keyPath: event)
			basicAnimation.fromValue = presentationLayer()?.valueForKey(event)
			basicAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
			basicAnimation.duration = animationDuration
			
			return basicAnimation
		}
		
		return super.actionForKey(event)
	}
	
	public override class func needsDisplayForKey(key: String) -> Bool {
		if key == "startAngle" || key == "endAngle" {
			return true
		}
		
		return super.needsDisplayForKey(key)
	}
}
