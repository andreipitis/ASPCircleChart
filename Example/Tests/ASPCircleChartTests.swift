//
//  ASPCircleChartTests.swift
//  ASPCircleChart
//
//  Created by Andrei-Sergiu Pițiș on 16/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import ASPCircleChart

class MockDataSource: ASPCircleChartDataSource {
	var items: [Double] = [7.5, 0, 10.08]
	
	func numberOfDataPoints() -> Int {
		return items.count
	}
	
	func dataPointsSum() -> Double {
		return items.reduce(0.0) { (combinedValue, newValue) -> Double in
			return combinedValue + newValue
		}
	}
	
	func dataPointAtIndex(_ index: Int) -> Double {
		return items[index]
	}
	
	func colorForDataPointAtIndex(_ index: Int) -> UIColor {
		return .black
	}
}

class ASPCircleChartTests: XCTestCase {
	
	var dataSource: MockDataSource!
	
    override func setUp() {
        super.setUp()
		dataSource = MockDataSource()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetDataSource_ShouldSetDataSource() {
        let sut = ASPCircleChart()
		sut.dataSource = dataSource
		
		XCTAssertNotNil(sut.dataSource, "Datasource is not nil.")
    }
	
	func testChangeDataPointValue_ShouldUpdateChartSlice() {
		let sut = ASPCircleChart()
		sut.dataSource = dataSource
		
		let firstSlice = sut.layer.sublayers!.first as! ASPCircleChartSliceLayer
		let firstSliceEndAngle = firstSlice.endAngle
		let firstSliceStartToEnd = firstSlice.endAngle - firstSlice.startAngle

		dataSource.items[0] = 3.14
		sut.reloadData()
		
		let updatedFirstSlice = sut.layer.sublayers!.first as! ASPCircleChartSliceLayer
		let updatedFirstSliceEndAngle = updatedFirstSlice.endAngle
		let updatedFirstSliceStartToEnd = updatedFirstSlice.endAngle - updatedFirstSlice.startAngle
		
		XCTAssertEqual(firstSlice, updatedFirstSlice, "References to the same object.")
		XCTAssertNotEqual(firstSliceEndAngle, updatedFirstSliceEndAngle, "Angles are different.")
		XCTAssertGreaterThan(firstSliceStartToEnd, updatedFirstSliceStartToEnd, "Initial distance is greater than updated distance.")
	}
	
	func testAddDataPointValue_ShouldInsertChartSlice() {
		let sut = ASPCircleChart()
		sut.dataSource = dataSource
		
		let initialNumberOfSlices = sut.layer.sublayers!.count
		
		dataSource.items.append(5)
		sut.reloadData()
		
		let updatedNumberOfSlices = sut.layer.sublayers!.count
		
		XCTAssertLessThan(initialNumberOfSlices, updatedNumberOfSlices, "New slice inserted.")
		XCTAssertEqual(updatedNumberOfSlices, sut.dataSource!.numberOfDataPoints(), "Slice count is equal to datasource count.")
	}
	
	func testRemoveDataPointValue_ShouldRemoveChartSlice() {
		let sut = ASPCircleChart()
		sut.dataSource = dataSource
		
		let initialNumberOfSlices = sut.layer.sublayers!.count
		
		dataSource.items.removeLast()
		sut.reloadData()
		
		let updatedNumberOfSlices = sut.layer.sublayers!.count
		
		XCTAssertGreaterThan(initialNumberOfSlices, updatedNumberOfSlices, "Slice removed.")
		XCTAssertEqual(updatedNumberOfSlices, sut.dataSource!.numberOfDataPoints(), "Slice count is equal to datasource count.")
	}
}
