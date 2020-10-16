//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Shawn Williams on 10/15/20.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String )?
    
    /// Setter for the number propery
    /// - Parameter number: the value to set
    mutating func setNumber(_ number: Double)  {
        self.number = number
    }
    
    /// Performs the appropiate calculation on number with the symbol param
    /// - Parameter symbol: the operation symbol
    /// - Returns: returns the results of the calculation
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    
    /// Performs the calculation for the entire operation
    /// - Parameter n2: the second number pressed
    /// - Returns: Returns the results of the operation
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
