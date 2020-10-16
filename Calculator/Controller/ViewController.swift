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
    // Create a Calculatore logic Object
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            //Get the value that inside the label as a number
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display lable text to a double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    

    
    /// Handles the logic for when a user pressed a non-numeric button
    /// - Parameter sender: The Cureent UI button sender
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        // Sets the number in the Calculator Logic
        calculator.setNumber(displayValue)
        
        // Change to display number to a possitive or negative number
        if let calcMethod =  sender.currentTitle {
           
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("Cannot get the results from the calculator logic")
            }
            displayValue = result
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
                // If numValue had a . perform this logic
                if numValue == "." {
                    // Round down the display label then compare that vaule to the old value to see if they match
                    let isInt = floor(displayValue) == displayValue
                    // If they dont match IE the old value already has a decimal point in the number simply return and dis allow adding more decimal numbers
                    // or appending . to the end of the display label text in the following lines
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }
    
}

