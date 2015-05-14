//
//  DateTimeViewController.swift
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/14/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the localized strings.
        localizeStrings()
        
        // Show localized dates and times.
        showDatesAndTimes()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Call this again in case the current locale has changed.
        showDatesAndTimes()
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
    }
    
    // Show localized dates and times.
    func showDatesAndTimes() {
        // Setup our date formatter using the currently set locale.
        let currentLocale = NSLocale(localeIdentifier: currentLocaleCode)
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = currentLocale
        
        // The date and time at this moment.
        let date = NSDate()
        
        // Show localized dates.
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateShortPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateMediumPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateLongPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dateFullPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        // Show localized times.
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        timeShortPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        timeMediumPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        dateFormatter.timeStyle = NSDateFormatterStyle.LongStyle
        timeLongPlaceholderLabel.text = dateFormatter.stringFromDate(date)
        
        // Show the first day of the week for this locale.
        let days = dateFormatter.weekdaySymbols
        let calendar = dateFormatter.calendar
        firstDayPlaceholderLabel.text = days[calendar.firstWeekday - 1] as? String
    }
}

