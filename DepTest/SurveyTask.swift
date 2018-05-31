//
//  SurveyTask.swift
//  DepTest
//
//  Created by Shubham Jindal on 16/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import Foundation
import ResearchKit

//Creating and displaying the survey
public var SurveyTask: ORKOrderedTask {
    //variable for the survey steps
    var steps = [ORKStep]()
    
    //introduction step
    let introStep = ORKInstructionStep(identifier: "IntroStep")
    introStep.title = "Welcome to the Survey Step!"
    introStep.text = "In this step you will be required to answer some questions for the study. You can choose to skip any question, but it is recommended that you must answer all the questions which will contribute more towards the study."
    steps += [introStep]
    
    //Question which collects the name
    let nameFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameFormat.multipleLines = false
    let nameStepTitle = "What's your name?"
    let nameStep = ORKQuestionStep(identifier: "QuestionStep", title: nameStepTitle, answer: nameFormat)
    steps += [nameStep]
    
    //Survey Questions for depression
    var questStepTitle = "Please tick your appropriate age group box"
    var textChoices = [
        ORKTextChoice(text: "Under 16", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "16 - 21", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "22 - 35", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "36 - 59", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "60 - 74", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "75+", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    var questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    var questStep = ORKQuestionStep(identifier: "AgeChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    
    questStepTitle = "Which gender do you most identify with?"
    textChoices = [
        ORKTextChoice(text: "Male", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Female", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Other", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "GenderChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    questStepTitle = "How often you find interest or Pleasure in doing things?"
    textChoices = [
        ORKTextChoice(text: "Not at All", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Several Days", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "More than Half the Days", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Nearly Every Day", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques2ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    questStepTitle = "Trouble concentrating on things, such as reading the newspaper or watching television"
    textChoices = [
        ORKTextChoice(text: "Not at All", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Several Days", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "More than Half the Days", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Nearly Every Day", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques4ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    //A question in Researhkit's scale format
    questStepTitle = "Trouble falling or staying asleep, or sleeping"
    let scaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 6, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly Every Day", minimumValueDescription: "Not at All")
    questStep = ORKQuestionStep(identifier: "Ques3ChoiceQuestionStep", title: questStepTitle, answer: scaleAnswerFormat)
    steps += [questStep]
    
    //Getting user's favorite color as a part of the survey
    let colorStepTitle = "What is your favorite color?"
    let colorArray = [
        (UIImage(named: "red")!, "Red"),
        (UIImage(named: "black")!, "Black"),
        (UIImage(named: "yellow")!, "Yellow"),
        (UIImage(named: "green")!, "Green"),
        (UIImage(named: "blue")!, "Blue"),
        (UIImage(named: "purple")!, "Purple")
    ]
    let imgChoices : [ORKImageChoice] = colorArray.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let colorAnsFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: imgChoices)
    let colorStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorStepTitle, answer: colorAnsFormat)
    steps += [colorStep]
    
    
    questStepTitle = "If you think you have depression, have you sought help for it? If so, from whom? Please tick any boxes that apply"
    textChoices = [
        ORKTextChoice(text: "G.P.", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Community Mental Health Team", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Mental Health Organisation (e.g. Depression Alliance Scotland, Bipolar Scotland)", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Internet online self-help", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Telephone helplines", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Family and Friends", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Have NOT sought help", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Other", value: 7 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques1ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    
    questStepTitle = "About how often did you feel so sad that nothing could cheer you up?"
    textChoices = [
        ORKTextChoice(text: "None of the Time", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Little of the Time", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Some of the Time", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Most of the Time", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "All the Time", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques5ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    
    questStepTitle = "I have lost interest in aspects of life that used to be important to me?"
    textChoices = [
        ORKTextChoice(text: "Not at All", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Just a Little", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Somewhat", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Moderately", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Quite a lot", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques6ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    
    questStepTitle = "I feel guilty and deserve to be punished."
    textChoices = [
        ORKTextChoice(text: "Not at All", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Slightly", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Moderately", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "To a Great Extent", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques7ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    
    questStepTitle = "Thoughts that you would be better off dead, or of hurting yourself."
    textChoices = [
        ORKTextChoice(text: "Not True", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Slightly True", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Moderately True", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Very Much True", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques8ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    
    questStepTitle = "When I wake up in the morning, I feel like there is nothing to look forward to."
    textChoices = [
        ORKTextChoice(text: "Most of the Time", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Often", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Sometimes", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Rarely", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Never", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    questAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    questStep = ORKQuestionStep(identifier: "Ques9ChoiceQuestionStep", title: questStepTitle, answer: questAnswerFormat)
    steps += [questStep]
    
    //Adding a summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy, Thanks!"
    steps += [summaryStep]
    
    //returning the survey
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
