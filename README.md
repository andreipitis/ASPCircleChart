# ASPCircleChart

[![CI Status](http://img.shields.io/travis/andreipitis/ASPCircleChart.svg?style=flat)](https://travis-ci.org/andreipitis/ASPCircleChart)
[![codebeat badge](https://codebeat.co/badges/ae8dea35-f040-41fb-b996-63f62dc855b6)](https://codebeat.co/projects/github-com-andreipitis-aspcirclechart)
[![Version](https://img.shields.io/cocoapods/v/ASPCircleChart.svg?style=flat)](http://cocoapods.org/pods/ASPCircleChart)
[![License](https://img.shields.io/cocoapods/l/ASPCircleChart.svg?style=flat)](http://cocoapods.org/pods/ASPCircleChart)
[![Platform](https://img.shields.io/cocoapods/p/ASPCircleChart.svg?style=flat)](http://cocoapods.org/pods/ASPCircleChart)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

![aspcirclechart](https://cloud.githubusercontent.com/assets/8778656/16629418/42a66dce-43be-11e6-9578-4e09df8c584b.gif)

```swift
let circleChart = ASPCircleChart(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
circleChart.dataSource = dataSource

circleChart.reloadData()
```

## Installation

ASPCircleChart is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ASPCircleChart"
```

## Author

Andrei-Sergiu Pitis, andrei.pitis@lateral-inc.com

## License

ASPCircleChart is available under the MIT license. See the LICENSE file for more info.
