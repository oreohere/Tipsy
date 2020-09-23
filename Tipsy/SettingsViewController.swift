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
    @IBOutlet weak var mode_control: UISegmentedControl!
    var flag = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        defaults.integer(forKey: "myTipIndex")
        let tip = defaults.integer(forKey: "tip_index")
        print("while entering settings tip index is "+String(tip))
        settings_tip_control.selectedSegmentIndex = tip
        mode_control.selectedSegmentIndex = defaults.integer(forKey: "mode")
        
        //get data about previous screen from user default and set segmented control likewise
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        if flag == 0{
            let index = settings_tip_control.selectedSegmentIndex
            let mode = mode_control.selectedSegmentIndex
            let defaults = UserDefaults.standard
            defaults.set(mode, forKey: "myModeIndex")
            defaults.set(index, forKey: "myTipIndex")
            defaults.synchronize()
        }
    }
    
    @IBAction func read_new_tip(_ sender: Any) {
        flag = 1
        let index = settings_tip_control.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "myTipIndex")
        defaults.synchronize()
    }
    @IBAction func read_new_mode(_ sender: Any) {
        let mode = mode_control.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(mode, forKey: "myModeIndex")
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
