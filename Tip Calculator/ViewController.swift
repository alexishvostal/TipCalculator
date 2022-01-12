//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Lexie Hvostal on 1/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(inputField.text!) ?? 0
        
        // Get tip by multiplying bill * tip percentage
        let tipPercentages = [0.15, 0.2, 0.25]
        let tip = bill *
            tipPercentages[tipAmount.selectedSegmentIndex]
        // Get total by adding tip to bill
        let total = bill + tip
        
        // Update total amount label
        totalLabel.text = String(format:"%.2f", total)
        // Update tip amount label
        tipLabel.text = String(format:"%.2f", tip)
    }
    
}

