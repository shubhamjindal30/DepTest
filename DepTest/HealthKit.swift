//
//  HealthKit.swift
//  DepTest
//
//  Created by Shubham Jindal on 27/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

//Implementation for HealthKit
class HealthKit: NSObject {
    
    static let healthKitStore = HKHealthStore()
    
    static var timer: Timer?
    
    //Taking the permissions from user to use health data
    static func authorizeHealthKit() {
        
        //Collecting data for heart rate and walking distance
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        ]
        
        healthKitStore.requestAuthorization(toShare: healthKitTypes,
                                            read: healthKitTypes) { _, _ in }
        
    }
    
    /*Method to get average heart rate for the past 30 seconds if the user's iPhone is connected
     to an apple watch and heart rate can be measured
     */
    static func getAVGHeartRate() {
        let typeHeartRate = HKQuantityType.quantityType(forIdentifier: .heartRate)
        let startTime = Date() - 60 * 60 //Start is the past one minute
        let predicate: NSPredicate? = HKQuery.predicateForSamples(withStart: startTime, end: Date(), options: HKQueryOptions.strictEndDate)
        //Query to find out the heart rate
        let squery = HKStatisticsQuery(quantityType: typeHeartRate!, quantitySamplePredicate: predicate, options: .discreteAverage, completionHandler: {(query: HKStatisticsQuery,result: HKStatistics?, error: Error?) -> Void in
            DispatchQueue.main.sync(execute: {() -> Void in
                let avgQuantity: HKQuantity? = result?.averageQuantity()
                let Heartbeats: Double? = avgQuantity?.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
                if (Heartbeats != nil) {
                    print("\n\nAverage Heart rate: \(Heartbeats!) count/min")
                } else
                {
                    print("\n\nCannot read Heart rate. Connect to an apple watch!")
                }
            })
        })
        
        //Executing the query using the HealthKit Store
        healthKitStore.execute(squery)
    }
}
