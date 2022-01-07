//
//  ViewController.swift
//  Calculator
//
//  Created by Canberk Bibican on 7.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet var digitButtons: [UIButton]!
    private var userIsTyping = false
    private var brain = CalculatorBrain()

    var calculatorResult: Double {
        get {
            return Double(result.text ?? "0.0") ?? 0.0
        }
        set {
            result.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func digitButtonTap(_ sender: UIButton) {
        if userIsTyping {
            var resultText = String(Int(calculatorResult))
            resultText = resultText + String(sender.tag)
            calculatorResult = NSString(string: resultText).doubleValue
        } else {
            calculatorResult = Double(sender.tag)
            userIsTyping.toggle()
        }
    }

    @IBAction func operationButtonTapped(_ sender: UIButton) {
        userIsTyping = false
        brain.setOperand(calculatorResult)
        brain.performOperation(sender.titleLabel?.text ?? "")
        calculatorResult = brain.result
    }
}

