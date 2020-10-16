//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Shawn Williams on 10/15/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    
    /// Setter for the number propery
    /// - Parameter number: the value to set
    mutating func setNumber(_ number: Double)  {
        self.number = number
    }
    
    /// Performs the appropiate calculation on number with the symbol param
    /// - Parameter symbol: the operation symbol
    /// - Returns: returns the results of the calculation
    func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "AC" {
                return 0
            } else if symbol == "+" {
                
            } else if symbol == "=" {
                
            }
        }
        return nil
    }
}
