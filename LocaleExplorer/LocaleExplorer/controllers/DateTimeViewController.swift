//
//  DateTimeViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = NSLocalizedString("IDS_DATES_TIMES_TAB", comment: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

