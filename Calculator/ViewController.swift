//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    
    
    /**
     Different access modifiers
     1. private - limiting in scope only accessable in the curly brances of the block of code it was defined
     2. fileprivate -  property or method is only accessible within the file it was declared
     3. internal - property or method is only accessible within the current module
     4. public - property or method is accessible to other modules.
     5. open - public + no restrictions and free to subclass and overidden
     */
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    /// Handles the logic for when a user pressed a non-numeric button
    /// - Parameter sender: The Cureent UI button sender
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        //Get the value that inside the label as a number
        guard Double(displayLabel.text!) != nil else {
            fatalError("Cannot convert display lable text to a double")
        }
        
    }
    
    
    /// Hanldes the logic for when the user pressed a number button
    /// - Parameter sender:The UI button Sender
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }
    
}

