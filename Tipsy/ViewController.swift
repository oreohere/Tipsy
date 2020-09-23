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
    @IBOutlet weak var share_label: UILabel!
    @IBOutlet weak var share_field: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "myTipIndex")
        tip_control.selectedSegmentIndex = index
        
        let bill = Double(bill_field.text!) ?? 0
        //calculate tip and total
        let tip_percent = [0.1, 0.15, 0.2]
        let tip = bill * tip_percent[tip_control.selectedSegmentIndex]
        total = bill + tip
        //update label with values
        tip_label.text = String(format: "$%.2f", tip)
        bill_label.text = String(format: "$%.2f", total)
        share_label.text = String(format: "$%.2f", total)
        let share_nos = Int(share_field.text!) ?? 1
        print("share_nos"+String(share_nos))
        let share = total / Double(share_nos)
        share_label.text = String(format: "$%.2f", share)
        print(share)
        
        let mode = defaults.integer(forKey: "myModeIndex")
        print(mode)
        switch mode {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        default:
            overrideUserInterfaceStyle = .light
        }
        bill_field.becomeFirstResponder()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let defaults = UserDefaults.standard
        let tip_index = tip_control.selectedSegmentIndex
        print("while exiting home tip index is "+String(tip_index))
        var mode = 0
        if self.traitCollection.userInterfaceStyle == .dark {
                mode = 1
               } else {
                mode = 0
               }
        defaults.set(tip_index, forKey: "tip_index")
        defaults.set(mode, forKey: "mode")
        defaults.synchronize()
        // save current screen data of segmented control to send via userdefaults
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    var total = 0.0
    
    @IBAction func CalculateTip(_ sender: Any) {
        //get the bill amount
        let bill = Double(bill_field.text!) ?? 0
        //calculate tip and total
        let tip_percent = [0.1, 0.15, 0.2]
        let tip = bill * tip_percent[tip_control.selectedSegmentIndex]
        total = bill + tip
        //update label with values
        tip_label.text = String(format: "$%.2f", tip)
        bill_label.text = String(format: "$%.2f", total)
        share_label.text = String(format: "$%.2f", total)
        let share_nos = Int(share_field.text!) ?? 1
        print("share_nos"+String(share_nos))
        let share = total / Double(share_nos)
        share_label.text = String(format: "$%.2f", share)
        print(share)
        
        
    }
    @IBAction func Share_calculation(_ sender: Any) {
        let share_nos = Int(share_field.text!) ?? 1
        print("share_nos"+String(share_nos))
        let share = total / Double(share_nos)
        share_label.text = String(format: "$%.2f", share)
        print(share)
    }
    
}

