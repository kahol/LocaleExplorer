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

    // MARK: Properties
    
    // Labels that will be replaced with runtime values.
    @IBOutlet weak var energyPlaceholderLabel: UILabel!
    @IBOutlet weak var lengthPlaceholderLabel: UILabel!
    @IBOutlet weak var massPlaceholderLabel: UILabel!
    
    // IBOutlets for localizing the strings.
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var increaseValueLabel: UILabel!
    @IBOutlet weak var forFoodLabel: UILabel!
    @IBOutlet weak var forPersonHeightLabel: UILabel!
    @IBOutlet weak var forPersonMassLabel: UILabel!
    
    // Only need one set of formatters, just keep changing its locale and properties.
    private let energyFormatter = NSEnergyFormatter()
    private let lengthFormatter = NSLengthFormatter()
    private let massFormatter = NSMassFormatter()
    
    // The user's current locale will be used by all three show functions.
    private var currentLocale: NSLocale!
    
    // Keep track of the current slider value to offset the values by.
    private var sliderValue = 0.0
    
    // MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the localized strings.
        localizeStrings()
        
        // Use only one fraction digit in all of the formatters.
        energyFormatter.numberFormatter.maximumFractionDigits = 1
        lengthFormatter.numberFormatter.maximumFractionDigits = 1
        massFormatter.numberFormatter.maximumFractionDigits = 1
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Display the values. Having it here ensures these will also get called when
        // the user changes tabs, in case they changed the current locale.
        currentLocale = NSLocale(localeIdentifier: currentLocaleCode)
        showValues()
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

    // MARK: Actions
    
    // Handle the user moving the value slider.
    @IBAction func increaseValue(sender: AnyObject) {
        let mySlider = sender as! UISlider
        sliderValue = Double(mySlider.value)
        
        showValues()
    }
    
    // Handle the user toggling the energy for food use switch.
    @IBAction func toggleFood(sender: AnyObject) {
        let mySwitch = sender as! UISwitch
        energyFormatter.forFoodEnergyUse = mySwitch.on
        
        showEnergy()
    }
    
    // Handle the user toggling the length for person height switch.
    @IBAction func toggleHeight(sender: AnyObject) {
        let mySwitch = sender as! UISwitch
        lengthFormatter.forPersonHeightUse = mySwitch.on
        
        showLength()
    }
    
    // Handle the user toggling the mass for person mass switch.
    @IBAction func toggleMass(sender: AnyObject) {
        let mySwitch = sender as! UISwitch
        massFormatter.forPersonMassUse = mySwitch.on
        
        showMass()
    }
    
    // MARK: Helper Methods
    
    // Set the localized strings.
    func localizeStrings() {
        energyLabel.text = NSLocalizedString("IDS_ENERGY", comment: "")
        lengthLabel.text = NSLocalizedString("IDS_LENGTH", comment: "")
        massLabel.text = NSLocalizedString("IDS_MASS", comment: "")
        increaseValueLabel.text = NSLocalizedString("IDS_INCREASE_VALUE", comment: "")
        forFoodLabel.text = NSLocalizedString("IDS_FOR_FOOD", comment: "")
        forPersonHeightLabel.text = NSLocalizedString("IDS_FOR_PERSON_HEIGHT", comment: "")
        forPersonMassLabel.text = NSLocalizedString("IDS_FOR_PERSON_MASS", comment: "")
    }
    
    // Show the localized energy, length, and mass values.
    func showValues() {
        showEnergy()
        showLength()
        showMass()
    }
    
    // Show a localized energy value.
    func showEnergy() {
        energyFormatter.numberFormatter.locale = currentLocale
        energyPlaceholderLabel.text = energyFormatter.stringFromJoules(sliderValue)
    }
    
    // Show a localized length value.
    func showLength() {
        lengthFormatter.numberFormatter.locale = currentLocale
        lengthPlaceholderLabel.text = lengthFormatter.stringFromMeters(sliderValue)
    }
    
    // Show a localized mass value.
    func showMass() {
        massFormatter.numberFormatter.locale = currentLocale
        massPlaceholderLabel.text = massFormatter.stringFromKilograms(sliderValue)
    }
}
