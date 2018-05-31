//
//  ViewController.swift
//  DepTest
//
//  Created by Shubham Jindal on 05/05/18.
//  Copyright © 2018 sjc. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        /*
         Print the results, this generates the results in the form of
         JSON which can be easily fetched and worked on in the back end
         */
        if (taskViewController.task?.identifier == "WalkTask"
            && reason == .completed) {
            
            let URLs = Results.findWalkHeartFiles(result: taskViewController.result)
            
            for url in URLs {
                do {
                    let string = try NSString.init(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
                    print(string)
                } catch {}
            }
        }
        
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    //Action to present the consent and collecting user name and signature
    @IBAction func consentTapped(_ sender: Any) {
        let taskController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskController.delegate = self as ORKTaskViewControllerDelegate
        present(taskController, animated: true, completion: nil)
    }
    
    //Action to present the survey
    @IBAction func surveyTapped(_ sender: Any) {
        let taskController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskController.delegate = self
        present(taskController, animated: true, completion: nil)
    }
    
    //Action for task 1 i.e. the Audio Task
    @IBAction func Task1Action(_ sender: Any) {
        let taskController = ORKTaskViewController(task: Task1, taskRun: nil)
        taskController.delegate = self as ORKTaskViewControllerDelegate
        taskController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true) as URL
        present(taskController, animated: true, completion: nil)
    }
    
    //Action for task 2 i.e. the Walking Task
    @IBAction func Task2Action(_ sender: Any) {
        HealthKit.authorizeHealthKit()
        let taskController = ORKTaskViewController(task: Task2, taskRun: nil)
        taskController.delegate = self as ORKTaskViewControllerDelegate
        taskController.outputDirectory = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0],
                                                   isDirectory: true) as URL
        present(taskController, animated: true, completion: nil)
        
        //print the average heart rate in console
        HealthKit.getAVGHeartRate()
    }
}

