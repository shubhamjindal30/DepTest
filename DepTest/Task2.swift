//
//  Task2.swift
//  DepTest
//
//  Created by Shubham Jindal on 27/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import Foundation
import ResearchKit

//Walking task of 45 seconds
public var Task2: ORKOrderedTask {
    return ORKOrderedTask.fitnessCheck(withIdentifier: "WalkTask",
                                                         intendedUseDescription: nil,
                                                         walkDuration: 45 as TimeInterval,
                                                         restDuration: 30 as TimeInterval,
                                                         options: .excludeAudio)
}
