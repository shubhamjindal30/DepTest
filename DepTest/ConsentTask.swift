//
//  ConsentTask.swift
//  DepTest
//
//  Created by Shubham Jindal on 11/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import Foundation
import ResearchKit

//Presenting the consent document in the form of a task
public var ConsentTask: ORKOrderedTask {
    
    //Variable for the consent steps
    var steps = [ORKStep]()
    
    //Adding the consent document and the steps
    let consentDoc = ConsentDocument
    let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDoc)
    steps += [consentStep]
    
    //Adding the signature collection step
    let signature = consentDoc.signatures!.first as! ORKConsentSignature
    
    let reviewStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDoc)
    
    reviewStep.text = "Review Consent!"
    reviewStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewStep]
    
    //returning the combined task
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
