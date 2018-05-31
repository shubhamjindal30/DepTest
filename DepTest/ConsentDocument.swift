//
//  ConsentDocument.swift
//  DepTest
//
//  Created by Shubham Jindal on 12/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import Foundation
import ResearchKit

//Creating the consent document or material
public var ConsentDocument: ORKConsentDocument {
    //Variable for consent document
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "User Consent"
    
    //Creating the sections of the consent document
    
    /*
     The consent sections are of eight different types and all of them
     are included in this document
     */
    let section1 = ORKConsentSection(type: .overview)
    section1.summary = "Welcome to DepTest"
    section1.content = "Welcome to DepTest. Thank you for taking time to participate in this reasearch conducted by Deakin University!"
    
    
    let section2 = ORKConsentSection(type: .dataGathering)
    section2.summary = "This reasearch requires data to be gathered!"
    section2.content = "The App will obtain information form you in two ways.  The first is information that you manually enter into the App. The second is information that the App collects automatically about you.\n\nInformation you manually enter into the App:\n\nWe collect Personal Information that directly identifies you, including your name, email address, and birth date.  We collect this information to verify (i) your identity, (ii) that you reside within Australia and New Zealand. In addition to these direct identifiers, we ask you to enter information including gender, weight, height, physical activity, sleep habits, and blood test data. In the future we may collect additional health-related information as the App is further developed. You can choose not to provide us with certain information, but then you will not be able to participate in the Study."
    
    
    let section3 = ORKConsentSection(type: .privacy)
    section3.summary = "This research gaurantees data privacy"
    section3.content = "This Privacy Policy covers our treatment of personally identifiable information that we gather when you are accessing or using the App. This Privacy Policy does not apply to the practices of companies or institutions that we do not own or control, or to individuals that we do not employ or manage.\n\nYour use of the App will allow you to provide us with Personal Information, including but not limited to information about your cardiovascular health, physical activity, and physical fitness.  The App collects your Personal Information for the purposes of a research study being conducted at Deakin University called the “ DepTest Study”. If you choose to use the App to provide us with any Personal Information, you must first review and acknowledge the informed consent form for the Study, which will be presented to you within the App."
    
    
    let section4 = ORKConsentSection(type: .dataUse)
    section4.summary = "There are ways in which your data will be used."
    section4.content = "DepTest uses the data provided by you to conduct a research about depression. We use the information that you enter as a record and then the other data collected in the app is used to analysed to create the results for the research."
    
    
    let section5 = ORKConsentSection(type: .timeCommitment)
    section5.summary = "This study will require some of your time!"
    section5.content = "By chosing to participate in this study, you commit to spare some time to enter your information, complete the survey and perform some tasks as well!"
    
    
    let section6 = ORKConsentSection(type: .studySurvey)
    section6.summary = "Completing the survey is a part of study!"
    section6.content = "The survey is a crucial part of this study or research. While there is an option to skip the questions in the survey, we recommend that you answer all the questions which will help for a better research and further steps can be taken accordingly. Thanks!"
    
    
    let section7 = ORKConsentSection(type: .studyTasks)
    section7.summary = "This study requires you to perform some tasks!"
    section7.content = "A part of the study or research is to make the users perform some activities which will surely help in making them feel relaxed and keep their mind calm."
    
    
    let section8 = ORKConsentSection(type: .withdrawing)
    section8.summary = "You can withdraw from the study anytime."
    section8.content = "If you do not wish to continue, you can always withdraw from participating this study but it will be very helpful if you participate fully and contribute towards the study of an issue which is becoming very common these days."
    
    //Adding the consent sections to the consent document
    consentDocument.sections = [section1, section2, section3, section4, section5, section6, section7, section8]
    
    //Taking the user consent, name and signature
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    //returning the document
    return consentDocument
}
