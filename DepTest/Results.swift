//
//  Results.swift
//  DepTest
//
//  Created by Shubham Jindal on 28/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import Foundation
import ResearchKit

//Generate results of the walktask in the form of JSON
struct Results {
    
    static func findWalkHeartFiles(result: ORKTaskResult) -> [NSURL] {
        
        //Creating the variable
        var urls = [NSURL]()
        
        if let results = result.results, results.count > 4,
            let resultWalk = results[3] as? ORKStepResult,
            let resultRest = results[4] as? ORKStepResult {
            
            //finding the results
            for result in resultWalk.results! {
                if let result = result as? ORKFileResult,
                    let Url = result.fileURL {
                    urls.append(Url as NSURL)
                }
            }
            
            for result in resultRest.results! {
                if let result = result as? ORKFileResult,
                    let Url = result.fileURL {
                    urls.append(Url as NSURL)
                }
            }
        }
        
        return urls
    }
}
