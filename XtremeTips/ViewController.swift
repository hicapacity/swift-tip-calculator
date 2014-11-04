//
//  ViewController.swift
//  XtremeTips
//
//  Created by Robert Matcuk on 11/3/14.
//
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmounts: UISegmentedControl!
    
    let tipPercents = [0.1, 0.15, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // Enable the "Done" button while editing
        navigationItem.rightBarButtonItem?.enabled = true
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        // Disable the "Done" button and update the tip/total
        navigationItem.rightBarButtonItem?.enabled = false
        updateValues()
        return true
    }
    
    /// Updates the tip and total
    @IBAction func updateValues() {
        let percent = tipPercents[tipAmounts.selectedSegmentIndex]
        let bill = (billField.text as NSString).doubleValue
        let tip = bill * percent
        let total = bill + tip
        tipLabel.text = String(format: "$ %.2f", tip)
        totalLabel.text = String(format: "$ %.2f", total)
    }

    /// Handle the clear button
    @IBAction func onClear(sender: AnyObject) {
        // Clear the bill field and update values
        billField.text = ""
        updateValues()
    }
    
    /// Handle the "Done" button
    @IBAction func onDone(sender: AnyObject) {
        view.endEditing(true)
        updateValues()
    }

}

