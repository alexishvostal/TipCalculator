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
        // Get default tip rate
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "Tip")
        tipAmount.selectedSegmentIndex = tipDefault
        
        self.syncSelectedTipOptionAndSlider()
        self.calculateTipAndTotal()
        
    }
    
    @IBAction func segmentedControlSelected(_ sender: Any) {
        self.syncSelectedTipOptionAndSlider()
        self.calculateTipAndTotal()
    }
    
    @IBAction func billAmountChanged(_ sender: Any) {
        self.calculateTipAndTotal()
    }
    
    @IBAction func tipRateSliderSelected(_ sender: Any) {
        self.calculateTipAndTotal()
    }
    
    func syncSelectedTipOptionAndSlider() {
        // Get tip rate selection
        var title = String(tipAmount.titleForSegment(at: tipAmount.selectedSegmentIndex)!)
        // Remove percent symbol
        title.removeLast()
        let newTipRate = Float(title)! * 0.01
        // Update tip slider label
        tipRateSlider.setValue(newTipRate, animated: true)
    }
    
    func calculateTipAndTotal() {
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
