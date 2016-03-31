//
//  ViewController.swift
//  StudyReviewApp
//
//  Created by Omar Sherief on 3/28/16.
//  Copyright © 2016 Project(X). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentConcept : String?
    var questionReturned : (String, String)?
    //var of time NSTimer to carry out the built in timing functions
    var timer = NSTimer()
    //Counter to keep track of NSTimer and set timer label on screen
    var counter = 1
    //Concepts to be shown on view
    var conceptsArray = ["Let v.s. Var",
        "Computed Initializers",
        "Computed Variables",
        "Setter Observers",
        "Functions",
        "External Parameters" ,
        "Default Parameters",
        "Anonymous Functions",
        "Optional Chaining",
        "Failable Initializers",
        "Casting",
        "Class Methods",
        "Extensions",
        "Enumeration",
        "Error Handling",
        "Dictionaries",
        "Conditional Binding",
        "Protocols",
        "Inheritance",
        "Structs",
        "Enums",
        "Classes",
        "Subscripts",
        "Setter Observers"]
    
    //View outlet declarations

    @IBOutlet weak var conceptsLabel: UILabel!
    @IBOutlet weak var nextConceptButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    //View outlets for the restart section
    @IBOutlet weak var RestartButton: UIButton!
    @IBOutlet weak var restartLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestartButton.alpha = 0
        restartLabel.alpha = 0
        
        
        //Pop the last concept from the array and set that to the label
        conceptsLabel.text = conceptsArray.popLast()
        
        currentConcept = conceptsLabel.text!
        
        
        //use the timer NSTimer to start a timer that starts at 1,
        // uses function updateCounter declared below to do something
        // every time the timer adds a second and it also repeats
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    //When function is called either set the label to the counter
    // or reset because we reached 30 secs
    func updateCounter() {
        timerLabel.text = String(++counter)
        if (counter == 30){
            resetCounter()
        }
    }
    
    
    //Reset the counter back to 1, and reset the NSTimer if conceptArray
    // still has concepts and show next concept,
    // otherwise show the other views for reset
    func resetCounter(){
        counter = 1
        timerLabel.text = String (counter)
        if (conceptsArray.count != 0){
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        conceptsLabel.text = conceptsArray.popLast()
        }
        else{
            
            conceptsLabel.hidden = true
            timerLabel.hidden = true
            nextConceptButton.hidden = true
            RestartButton.hidden = false
            restartLabel.hidden = false
            UIView.animateWithDuration(5){ self.animateRestart()}
        }
    }
    
    
    func animateRestart () -> Void{
        RestartButton.alpha = 1
        restartLabel.alpha = 1
    }
    

    
    //When next concept pressed call function reset the counter and show next concept
    @IBAction func nextConceptPressed(sender: UIButton) {
        resetCounter()
    }

    //When the reset button is pressed, set conceptsArray back to the
    // original list of concepts, call ^resetCounter(), also show/hide views
    @IBAction func restartButtonPressed(sender: UIButton) {
        conceptsArray = ["Let v.s. Var",
            "Computed Initializers",
            "Computed Variables",
            "Setter Observers",
            "Functions",
            "External Parameters" ,
            "Default Parameters",
            "Anonymous Functions",
            "Optional Chaining",
            "Failable Initializers",
            "Casting",
            "Class Methods",
            "Extensions",
            "Enumeration",
            "Error Handling",
            "Dictionaries",
            "Conditional Binding",
            "Protocols",
            "Inheritance",
            "Structs",
            "Enums",
            "Classes",
            "Subscripts",
            "Setter Observers"]
        resetCounter()
        RestartButton.hidden = true
        restartLabel.hidden = true
        timerLabel.hidden = false
        conceptsLabel.hidden = false
        nextConceptButton.hidden = false
        
        RestartButton.alpha = 0
        restartLabel.alpha = 0
        
    }
}

