//
//  CalcutorBrain.swift
//  Calculator
//
//  Created by Canberk Bibican on 7.01.2022.
//

import Foundation

class CalculatorBrain {
    private var accumulator: Double = 0
    private var operationResult: Double = 0
    private var operant: String = String()

    var result: Double {
        get {
            return accumulator
        }
    }

    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }
        operant = operation != "=" ? operation : operant
        switch operation {
        case "C":
            accumulator = 0
        case "CE":
            accumulator = Double(String(Int(accumulator)).dropLast()) ?? 0
        case "=":
            caculate(operant)
        default:
            break
        }
        operationResult = result
    }

    // Operations performed when tapped equal
    func caculate(_ operant: String?) {
        guard let operant = operant else { return }
        switch operant {
        case "√":
            accumulator = sqrt(result)
        case "+":
            accumulator = operationResult + result
        case "-":
            accumulator = operationResult - result
        case "*":
            accumulator = operationResult * result
        case "/":
            accumulator = operationResult / result
        default:
            break
        }
    }

    func setOperand(_ value: Double) {
        accumulator = value
    }
}

