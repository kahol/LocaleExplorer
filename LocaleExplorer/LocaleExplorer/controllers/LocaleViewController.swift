//
//  LocaleViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit

// Keep track of the user's input locale code. Setting as global since it will be used in the other ViewControllers.
var currentLocaleCode = "en-US"

class LocaleViewController: UIViewController {

    // Labels that will be replaced with runtime values.
    @IBOutlet weak var deviceLocaleCodePlaceholderLabel: UILabel!
    @IBOutlet weak var deviceLocaleNamePlaceholderLabel: UILabel!
    @IBOutlet weak var currentLocaleCodePlaceholderLabel: UILabel!
    @IBOutlet weak var currentLocaleNamePlaceholderLabel: UILabel!
    
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
    
    // Device locale will not change, so keeping it here.
    private let deviceLocale = NSLocale.currentLocale()
    private let deviceLocaleCode = NSLocale.currentLocale().localeIdentifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially set the current locale to the device locale.
        currentLocaleCode = deviceLocaleCode
        
        // Set the localized strings.
        localizeStrings()
        
        // Show locale information.
        deviceLocaleCodePlaceholderLabel.text = deviceLocaleCode
        deviceLocaleNamePlaceholderLabel.text = deviceLocale.displayNameForKey(NSLocaleIdentifier, value: deviceLocaleCode)
        currentLocaleCodePlaceholderLabel.text = currentLocaleCode
        currentLocaleNamePlaceholderLabel.text = deviceLocale.displayNameForKey(NSLocaleIdentifier, value: currentLocaleCode)
        
    }

    // The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = NSLocalizedString("IDS_LOCALE_TAB", comment: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    // Change the current locale based on the user's input.
    @IBAction func applyLocale(sender: AnyObject) {
        let inputLocaleCode = localeField.text
        
        // Any invalid locale code, including an empty string, causes displayNameForKey to return nil.
        if let inputLocaleName = deviceLocale.displayNameForKey(NSLocaleIdentifier, value: inputLocaleCode) {
            currentLocaleCode = inputLocaleCode
            currentLocaleCodePlaceholderLabel.text = inputLocaleCode
            currentLocaleNamePlaceholderLabel.text = inputLocaleName
        } else {
            // Let the user know their input locale was invalid.
            let alertTitle = NSLocalizedString("IDS_ALERT_TITLE", comment: "")
            let alertMessage = String(format: NSLocalizedString("IDS_ALERT_MESSAGE", comment: ""), inputLocaleCode)
            let alertOK = NSLocalizedString("IDS_ALERT_OK", comment: "")
            
            var alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: alertOK, style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
        
        localeField.text = ""
    }
    
    // MARK: Helper Methods
    
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

}
