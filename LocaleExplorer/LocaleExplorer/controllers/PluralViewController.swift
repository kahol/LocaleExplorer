//
//  PluralViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/20/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit

class PluralViewController: UIViewController {

    // MARK: Properties
    
    // Label that will be replaced with runtime value.
    @IBOutlet weak var pluralPlaceholderLabel: UILabel!
    
    // MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pluralPlaceholderLabel.text = String(format: NSLocalizedString("IDS_DAYS_AGO", comment: ""), 0)
    }

    // The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = NSLocalizedString("IDS_PLURALS_TAB", comment: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    
    @IBAction func changeDays(sender: AnyObject) {
        let myStepper = sender as! UIStepper
        let currentValue = Int(myStepper.value)
        
        pluralPlaceholderLabel.text = String(format: NSLocalizedString("IDS_DAYS_AGO", comment: ""), currentValue)
    }
}
