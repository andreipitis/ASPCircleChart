//
//  ASPCircleChartSliceLayerTests.swift
//  ASPCircleChart
//
//  Created by Andrei-Sergiu Pițiș on 16/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import ASPCircleChart

class ASPCircleChartSliceLayerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitSlice_ShouldCreateSliceLayer() {
		let sut = ASPCircleChartSliceLayer()
		
		XCTAssertNotNil(sut, "Slice Layer is not nil.")
    }
	
	func testInitSliceFromCoder_ShouldCreateSliceLayer() {
		let archiver = NSKeyedUnarchiver(forReadingWith: Data())
		let sut = ASPCircleChartSliceLayer(coder: archiver)
		
		XCTAssertNotNil(sut, "Slice Layer is not nil.")
	}
}
