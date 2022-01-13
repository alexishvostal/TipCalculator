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
    @IBOutlet weak var tipRateSlider: UISlider!
    @IBOutlet weak var tipRateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputField.keyboardType = .numberPad
        inputField.becomeFirstResponder()
        inputField.backgroundColor = UIColor.systemGray5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "Tip")
        tipAmount.selectedSegmentIndex = tipDefault
        
        // Get bill amount from text field input
        let bill = Double(inputField.text!) ?? 0
        
        // Get default tip rate
        var title = String(tipAmount.titleForSegment(at:
            tipAmount.selectedSegmentIndex)!)
        title.removeLast()
        let tipRate = Float(title)! * 0.01
        
        // Get tip by multiplying bill * tip rate
        let tip = bill * Double(tipRate)
        // Get total by adding tip to bill
        let total = bill + tip
        
        
        // Update total amount label
        totalLabel.text = String(format:"$%.2f", total)
        // Update tip amount label
        tipLabel.text = String(format:"$%.2f", tip)
        // Update tip rate label
        tipRateLabel.text = title + "%"
        // Update tip slider label
        tipRateSlider.setValue(tipRate, animated: true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(inputField.text!) ?? 0
        
        // Get tip rate selection
        var title = String(tipAmount.titleForSegment(at: tipAmount.selectedSegmentIndex)!)
        title.removeLast()
        let tipRate = Float(title)! * 0.01
        
        // Get tip by multiplying bill * tip rate
        let tip = bill * Double(tipRate)
        // Get total by adding tip to bill
        let total = bill + tip
        
        // Update total amount label
        totalLabel.text = String(format:"$%.2f", total)
        // Update tip amount label
        tipLabel.text = String(format:"$%.2f", tip)
        // Update tip rate label
        tipRateLabel.text = title + "%"
        // Update tip slider label
        tipRateSlider.setValue(tipRate, animated: true)
    }
    
    @IBAction func calculateTip2(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(inputField.text!) ?? 0
        
        // Get tip rate value
        let tipRate = round(tipRateSlider.value * 100) / 100.0
        let tipRateValue = 100 * (tipRate)
        
        
        // Get tip by multiplying bill * tip rate
        let tip = bill * Double(tipRate)
        // Get total by adding tip to bill
        let total = bill + tip
        
        // Update total amount label
        totalLabel.text = String(format:"$%.2f", total)
        // Update tip amount label
        tipLabel.text = String(format:"$%.2f", tip)
        // Update tip rate label
        tipRateLabel.text = String(format:"%.0f%%", tipRateValue)
    }
    
    
    @IBAction func calculateTip3(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(inputField.text!) ?? 0
        
        // Get tip rate value
        let tipRate = round(tipRateSlider.value * 100) / 100.0
        let tipRateValue = 100 * tipRate
        
        // Get tip by multiplying bill * tip rate
        let tip = bill * Double(tipRate)
        // Get total by adding tip to bill
        let total = bill + tip
        
        // Update total amount label
        totalLabel.text = String(format:"$%.2f", total)
        // Update tip amount label
        tipLabel.text = String(format:"$%.2f", tip)
        // Update tip rate label
        tipRateLabel.text = String(format:"%.0f%%", tipRateValue)
    }
    
}

