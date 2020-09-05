//
//  ViewController.swift
//  Tipsy
//
//  Created by Oyendrila Dobe on 9/5/20.
//  Copyright © 2020 oyendrila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bill_field: UITextField!
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var bill_label: UILabel!
    
    @IBOutlet weak var tip_control: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func CalculateTip(_ sender: Any) {
        //get the bill amount
        let bill = Double(bill_field.text!) ?? 0
        print("hello")
        print(bill)
        //calculate tip and total
        let tip_percent = [0.1, 0.15, 0.2]
        print("hiii")
        let tip = bill * tip_percent[tip_control.selectedSegmentIndex]
        let total = bill + tip
        
        //update label with values
        tip_label.text = String(format: "$%.2f", tip)
        bill_label.text = String(format: "$%.2f", total)
        
    }
}

