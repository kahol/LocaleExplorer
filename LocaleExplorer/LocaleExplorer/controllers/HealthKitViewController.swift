//
//  HealthKitViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit
import HealthKit

class HealthKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = NSLocalizedString("IDS_HEALTHKIT_TAB", comment: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
