//
//  ChartController.swift
//  SaleManager
//
//  Created by Nugumanov Dmitry on 12/22/18.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import UIKit
import Charts

class ChartController {
    
    let worker = FireBaseWorker()
    @IBOutlet weak var barChartView: BarChartView!
    
    func drawChart(_ view: BarChartView) {
        var dataEntries = [BarChartDataEntry]()
        
        
        let mounth = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
        let value = [10000, 2000, 24000, 6120, 4123, 10200, 12900, 4000]
        
        // добавить поля Double и Date с ценой и предать их в график
        
        for i in 0..<value.count {
            
            let entry = BarChartDataEntry(x: Double(i), y: Double(value[i]))
            
            print(entry)
            dataEntries.append(entry)
        }
        view.xAxis.valueFormatter = IndexAxisValueFormatter(values: mounth)
        view.contentMode = .scaleAspectFill
        let barChartDataSet = BarChartDataSet(values: dataEntries, label: "")
        barChartDataSet.drawValuesEnabled = false
        barChartDataSet.colors = ChartColorTemplates.colorful()
        
        let barChartData = BarChartData(dataSet: barChartDataSet)
        view.data = barChartData
        view.legend.enabled = false
        view.contentMode = .scaleAspectFill
        
        view.xAxis.granularityEnabled = true
        view.xAxis.granularity = 1
        
        DispatchQueue.main.async {
            view.animate(xAxisDuration: 1.0, yAxisDuration: 3.0, easingOption: .easeOutSine)
        }
//
        
        view.chartDescription?.text = ""
        
        
        view.zoom(scaleX: 3.1, scaleY: 0.1, x: 0, y: 5)
        
        let rightAxis = view.rightAxis
        rightAxis.drawGridLinesEnabled = false
        
        
        let leftAxis = view.leftAxis
        leftAxis.drawGridLinesEnabled = false
        
        let xAxis = view.xAxis
        xAxis.drawGridLinesEnabled = false
        view.setVisibleXRange(minXRange: 8.0, maxXRange: 8.0)
        
        view.setExtraOffsets (left: 0, top: 20.0, right:0.0, bottom: 20.0)
        
    }
    
}
