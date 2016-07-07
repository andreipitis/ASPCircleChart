//
//  ViewController.swift
//  ASPCircleChart
//
//  Created by Andrei-Sergiu Pitis on 06/17/2016.
//  Copyright (c) 2016 Andrei-Sergiu Pitis. All rights reserved.
//

import UIKit
import ASPCircleChart

class ViewController: UIViewController {
	
	@IBOutlet weak var circleChart: ASPCircleChart!
	
	let dataSource = DataSource()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		circleChart.dataSource = dataSource
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		var numberOfSlices = 2
		
		while numberOfSlices <= 2 {
			numberOfSlices = random() % 8
		}
		
		var values = [Double]()
		
		for _ in 0..<numberOfSlices {
			let randomNumber = Double(random() % 100)
			values.append(randomNumber)
		}
		
		dataSource.items = values
		circleChart.reloadDataSource()
	}
}

class DataSource: ASPCircleChartDataSource {
	var items: [Double] = [44, 10, 134]
	
	@objc func numberOfDataPoints() -> Int {
		return items.count
	}
	
	@objc func dataPointsSum() -> Double {
		return items.reduce(0.0, combine: { (initial, new) -> Double in
			return initial + new
		})
	}
	
	@objc func dataPointAtIndex(index: Int) -> Double {
		return items[index]
	}
	
	
	@objc func colorForDataPointAtIndex(index: Int) -> UIColor {
		switch index {
		case 0:
			return UIColor(red: 205/255.0, green: 213/255.0, blue: 66/255.0, alpha: 1.0)
		case 1:
			return UIColor(red: 242/255.0, green: 115/255.0, blue: 82/255.0, alpha: 1.0)
		case 2:
			return UIColor(red: 83/255.0, green: 158/255.0, blue: 55/255.0, alpha: 1.0)
		default:
			return UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: 1.0)
		}
	}
}

