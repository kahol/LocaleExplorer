//
//  DateTimeViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {

    // MARK: Properties
    
    // Labels that will be replaced with runtime values.
    @IBOutlet weak var dateShortPlaceholderLabel: UILabel!
    @IBOutlet weak var dateMediumPlaceholderLabel: UILabel!
    @IBOutlet weak var dateLongPlaceholderLabel: UILabel!
    @IBOutlet weak var dateFullPlaceholderLabel: UILabel!
    @IBOutlet weak var timeShortPlaceholderLabel: UILabel!
    @IBOutlet weak var timeMediumPlaceholderLabel: UILabel!
    @IBOutlet weak var timeLongPlaceholderLabel: UILabel!
    @IBOutlet weak var firstDayPlaceholderLabel: UILabel!
    
    // IBOutlets for localizing the strings.
    @IBOutlet weak var dateStylesLabel: UILabel!
    @IBOutlet weak var dateShortLabel: UILabel!
    @IBOutlet weak var dateMediumLabel: UILabel!
    @IBOutlet weak var dateLongLabel: UILabel!
    @IBOutlet weak var dateFullLabel: UILabel!
    @IBOutlet weak var timeStylesLabel: UILabel!
    @IBOutlet weak var timeShortLabel: UILabel!
    @IBOutlet weak var timeMediumLabel: UILabel!
    @IBOutlet weak var timeLongLabel: UILabel!
    @IBOutlet weak var firstDayLabel: UILabel!
    @IBOutlet weak var increaseDateLabel: UILabel!
    @IBOutlet weak var increaseTimeLabel: UILabel!
    
    // Only need one DateFormatter, just keep changing its locale and style.
    private let dateFormatter = NSDateFormatter()
    
    // Keep track of the current slider values to offset the date and time by.
    private var dateSliderValue = 0
    private var timeSliderValue = 0
    
    // MARK: UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the localized strings.
        localizeStrings()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set to current locale and GMT time zone.
        dateFormatter.locale = NSLocale(localeIdentifier: currentLocaleCode)
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        
        // Display the dates and times. Having it here ensures these will also get called when
        // the user changes tabs, in case they changed the current locale.
        showDates()
        showTimes()
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

    // MARK: Actions
    
    // Handle the user moving the date slider.
    @IBAction func increaseDateInterval(sender: AnyObject) {
        let mySlider = sender as! UISlider
        dateSliderValue = Int(mySlider.value)
        
        showDates()
    }
    
    // Handle the user moving the time slider.
    @IBAction func increaseTimeInterval(sender: AnyObject) {
        let mySlider = sender as! UISlider
        timeSliderValue = Int(mySlider.value)
        
        showTimes()
    }
    
    // MARK: Helper Methods
    
    // Set the localized strings.
    func localizeStrings() {
        dateStylesLabel.text = NSLocalizedString("IDS_DATE_STYLES", comment: "")
        dateShortLabel.text = NSLocalizedString("IDS_SHORT", comment: "")
        dateMediumLabel.text = NSLocalizedString("IDS_MEDIUM", comment: "")
        dateLongLabel.text = NSLocalizedString("IDS_LONG", comment: "")
        dateFullLabel.text = NSLocalizedString("IDS_FULL", comment: "")
        timeStylesLabel.text = NSLocalizedString("IDS_TIME_STYLES", comment: "")
        timeShortLabel.text = NSLocalizedString("IDS_SHORT", comment: "")
        timeMediumLabel.text = NSLocalizedString("IDS_MEDIUM", comment: "")
        timeLongLabel.text = NSLocalizedString("IDS_LONG", comment: "")
        firstDayLabel.text = NSLocalizedString("IDS_FIRST_DAY", comment: "")
        increaseDateLabel.text = NSLocalizedString("IDS_INCREASE_DATE", comment: "")
        increaseTimeLabel.text = NSLocalizedString("IDS_INCREASE_TIME", comment: "")
    }
    
    // Show localized dates.
    func showDates() {
        // The date offset from the slider value, which can be from 0 to 365.
        // Start from the reference date of 1/1/2001.
        let dateInterval = 60 * 60 * 24 * dateSliderValue;
        let date = NSDate(timeIntervalSinceReferenceDate: Double(dateInterval))
        
        // Show localized dates.
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateShortPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateMediumPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateLongPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dateFullPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        // Show the first day of the week for this locale.
        let days = dateFormatter.weekdaySymbols
        let calendar = dateFormatter.calendar
        firstDayPlaceholderLabel.text = days[calendar.firstWeekday - 1] as? String
    }
    
    // Show localized times.
    func showTimes() {
        // The time offset from the slider value, which can be from 0 to 24 * 60 (1440).
        // Start from the reference time of 12:00 AM GMT.
        let timeInterval = 60 * timeSliderValue;
        let date = NSDate(timeIntervalSinceReferenceDate: Double(timeInterval))
        
        // Show localized times.
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        timeShortPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        timeMediumPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.timeStyle = NSDateFormatterStyle.LongStyle
        timeLongPlaceholderLabel.text = dateFormatter.stringFromDate(date)
    }
}

