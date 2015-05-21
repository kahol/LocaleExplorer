//
//  NumberViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit

class NumberViewController: UIViewController {

    // MARK: Properties
    
    // Labels that will be replaced with runtime values.
    @IBOutlet weak var decimalPlaceholderLabel: UILabel!
    @IBOutlet weak var currencyPlaceholderLabel: UILabel!
    @IBOutlet weak var percentPlaceholderLabel: UILabel!
    @IBOutlet weak var scientificPlaceholderLabel: UILabel!
    @IBOutlet weak var currencySymbolPlaceholderLabel: UILabel!
    @IBOutlet weak var spellOutTextView: UITextView!
    
    // IBOutlets for localizing the strings.
    @IBOutlet weak var numberStylesLabel: UILabel!
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var scientificLabel: UILabel!
    @IBOutlet weak var spellOutLabel: UILabel!
    @IBOutlet weak var currencySymbolLabel: UILabel!
    @IBOutlet weak var increaseNumberLabel: UILabel!
    
    // Only need one NumberFormatter, just keep changing its locale and style.
    private let numberFormatter = NSNumberFormatter()
    
    // Keep track of the current slider value to offset the number by.
    private var numberSliderValue = 1.0
    
    // Initial number to localize and display.
    private let myNumber = 99.99
    
    // MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the localized strings.
        localizeStrings()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Display the localized numbers. Having it here ensures this will also get called when
        // the user changes tabs, in case they changed the current locale.
        showNumbers()
    }
    
    // The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title = NSLocalizedString("IDS_NUMBERS_CURRENCY_TAB", comment: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    // Handle the user moving the number slider.
    @IBAction func increaseNumber(sender: AnyObject) {
        let mySlider = sender as! UISlider
        numberSliderValue = Double(mySlider.value)
        
        showNumbers()
    }
    
    // MARK: Helper Methods

    // Set the localized strings.
    func localizeStrings() {
        numberStylesLabel.text = NSLocalizedString("IDS_NUMBER_STYLES", comment: "")
        decimalLabel.text = NSLocalizedString("IDS_DECIMAL", comment: "")
        currencyLabel.text = NSLocalizedString("IDS_CURRENCY", comment: "")
        percentLabel.text = NSLocalizedString("IDS_PERCENT", comment: "")
        scientificLabel.text = NSLocalizedString("IDS_SCIENTIFIC", comment: "")
        spellOutLabel.text = NSLocalizedString("IDS_SPELLOUT", comment: "")
        currencySymbolLabel.text = NSLocalizedString("IDS_CURRENCY_CODE", comment: "")
        increaseNumberLabel.text = NSLocalizedString("IDS_INCREASE_NUMBER", comment: "")
    }
    
    // Display the localized numbers.
    func showNumbers() {
        // Setup our number formatter using the currently set locale.
        let currentLocale = NSLocale(localeIdentifier: currentLocaleCode)
        numberFormatter.locale = currentLocale
        
        // Multiply myNumber by the current slider value.
        let number = myNumber * numberSliderValue
        
        // Set the number formatter to always use thousands separators and show 2 decimal places.
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        // Show localized numbers.
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decimalPlaceholderLabel.text = numberFormatter.stringFromNumber(number)
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyPlaceholderLabel.text = numberFormatter.stringFromNumber(number)
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        percentPlaceholderLabel.text = numberFormatter.stringFromNumber(numberSliderValue/100_000)
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.ScientificStyle
        scientificPlaceholderLabel.text = numberFormatter.stringFromNumber(number)
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.SpellOutStyle
        spellOutTextView.text = numberFormatter.stringFromNumber(number)
        
        // Show the currency code for this locale.
        if let currencyCode = currentLocale.objectForKey(NSLocaleCurrencyCode) as? String {
            currencySymbolPlaceholderLabel.text = currencyCode
        }
    }
    
}

