//
//  FilterViewDelegate.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/16/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

/*
 * @description
 *     Pass data to the homeViewController 
 */
protocol FilterViewDelegate {
    func closeFilterView()
    func setFilterOptions(opts: [String], enable: Bool)
}
