//
//  LocaleViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Globalization. All rights reserved.
//

import UIKit

class LocaleViewController: UIViewController {

    // Labels that will be replaced with runtime values.
    @IBOutlet weak var deviceLocaleCode: UILabel!
    @IBOutlet weak var deviceLocaleName: UILabel!
    @IBOutlet weak var currentLocaleCode: UILabel!
    @IBOutlet weak var currentLocaleName: UILabel!
    
    // Field that will contain the user's input locale.
    @IBOutlet weak var localeField: UITextField!
    
    // IBOutlets for localizing the strings.
    @IBOutlet weak var deviceSettingsLabel: UILabel!
    @IBOutlet weak var deviceLocaleCodeLabel: UILabel!
    @IBOutlet weak var deviceLocaleNameLabel: UILabel!
    @IBOutlet weak var currentSettingsLabel: UILabel!
    @IBOutlet weak var currentLocaleCodeLabel: UILabel!
    @IBOutlet weak var currentLocaleNameLabel: UILabel!
    @IBOutlet weak var setLocaleLabel: UILabel!
    @IBOutlet weak var localeHintLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    // Keep track of the user's input locale code.
    var currentLocale = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially set the current locale to the device locale.
        let deviceLocale = NSLocale.currentLocale()
        currentLocale = deviceLocale.localeIdentifier
        
        // Set the localized strings.
        localizeStrings()
        
        // Show locale information.
        deviceLocaleCode.text = deviceLocale.localeIdentifier
        deviceLocaleName.text = deviceLocale.displayNameForKey(NSLocaleIdentifier, value: deviceLocale.localeIdentifier)
        currentLocaleCode.text = currentLocale
        currentLocaleName.text = deviceLocale.displayNameForKey(NSLocaleIdentifier, value: currentLocale)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change the current locale based on the user's input.
    @IBAction func applyLocale(sender: AnyObject) {
        // If there's something in the text field, then set that as the new current locale.
        // *TODO* - add checks to see if code entered is valid.
        if let userLocale = localeField.text {
            currentLocale = userLocale
            currentLocaleCode.text = currentLocale
            currentLocaleName.text = NSLocale.currentLocale().displayNameForKey(NSLocaleIdentifier, value: currentLocale)
            
            localeField.text = ""
        }
    }
    
    // Set the localized strings.
    func localizeStrings() {
        deviceSettingsLabel.text = NSLocalizedString("IDS_DEVICE_SETTINGS", comment: "")
        deviceLocaleCodeLabel.text = NSLocalizedString("IDS_LOCALE_CODE", comment: "")
        deviceLocaleNameLabel.text = NSLocalizedString("IDS_LOCALE_NAME", comment: "")
        currentSettingsLabel.text = NSLocalizedString("IDS_CURRENT_SETTINGS", comment: "")
        currentLocaleCodeLabel.text = NSLocalizedString("IDS_LOCALE_CODE", comment: "")
        currentLocaleNameLabel.text = NSLocalizedString("IDS_LOCALE_NAME", comment: "")
        setLocaleLabel.text = NSLocalizedString("IDS_SET_LOCALE", comment: "")
        localeHintLabel.text = NSLocalizedString("IDS_LOCALE_HINT_TEXT", comment: "")
        applyButton.setTitle(NSLocalizedString("IDS_APPLY_BTN", comment: ""), forState: UIControlState.Normal)
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
