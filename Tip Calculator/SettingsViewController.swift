//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Lexie Hvostal on 1/12/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var navigation: UINavigationItem!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "Tip")
        segmentedControl.selectedSegmentIndex = tipDefault
        
    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        // Set default tip rate value
        let defaults = UserDefaults.standard
        defaults.set(segmentedControl.selectedSegmentIndex, forKey: "Tip")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
