//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Oyendrila Dobe on 9/6/20.
//  Copyright © 2020 oyendrila. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settings_tip_control: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func read_new_tip(_ sender: Any) {
        let index = settings_tip_control.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "myInt")
        defaults.synchronize()
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
