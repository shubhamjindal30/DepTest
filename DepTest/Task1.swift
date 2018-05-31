//
//  Task1.swift
//  DepTest
//
//  Created by Shubham Jindal on 26/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//


import Foundation
import ResearchKit

//Task to analyse the voice of the user by asking him to speak the sentence
public var Task1: ORKOrderedTask {
    
    return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read.", speechInstruction: "Try to speak closer to the microphone for better results!", shortSpeechInstruction: "Hurray! And the President took leave to allow some time for family." , duration: 10, recordingSettings: nil, checkAudioLevel: false, options: .excludeConclusion)
}
