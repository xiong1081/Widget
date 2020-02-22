//
//  TodayViewController.swift
//  BatteryExtension
//
//  Created by 李招雄 on 2020/2/22.
//  Copyright © 2020 李招雄. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var systemLabel: UILabel!
    @IBOutlet weak var batteryLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = UIDevice.current.name
        systemLabel.text = "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
        UIDevice.current.isBatteryMonitoringEnabled = true
        batteryLabel.text = "\(Int(UIDevice.current.batteryLevel*100))%"
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        hideSystemLabel()
    }
    
    func hideSystemLabel() {
        let userDefaults = UserDefaults(suiteName: "group.com.van.demo")
        let snv = userDefaults?.object(forKey: "SystemNameVersion")
        if let snvNum = snv as? NSNumber, snvNum.boolValue == false {
            systemLabel.isHidden = true
        } else {
            systemLabel.isHidden = false
        }
    }
    
    @IBAction func tapSetting(_ sender: UIButton) {
        let url = URL(string: "battery://")!
        extensionContext?.open(url, completionHandler: nil)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let height = maxSize.height > 222 ? 222 : maxSize.height
        let size = CGSize(width: maxSize.width, height: height)
        self.preferredContentSize = size
        if activeDisplayMode == .expanded {
            settingButton.isHidden = false
        } else {
            settingButton.isHidden = true
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        hideSystemLabel()
        completionHandler(NCUpdateResult.newData)
    }
    
}
