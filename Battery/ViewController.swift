//
//  ViewController.swift
//  Battery
//
//  Created by 李招雄 on 2020/2/22.
//  Copyright © 2020 李招雄. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func systemNameVersionSwitch(_ sender: UISwitch) {
        let userDefaults = UserDefaults(suiteName: "group.com.van.demo")
        userDefaults?.set(NSNumber(value: sender.isOn), forKey: "SystemNameVersion")
    }
    
}

