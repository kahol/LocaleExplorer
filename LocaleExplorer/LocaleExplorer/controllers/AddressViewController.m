//
//  AddressViewController.m
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/20/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

#import "AddressViewController.h"

#import "LocaleExplorer-Swift.h"

#import <AddressBookUI/AddressBookUI.h>

@interface AddressViewController ()

@end

@implementation AddressViewController

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the localized strings.
    [self localizeStrings];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Show the localized addresses.
    [self showAddresses];
}

// The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
- (void)awakeFromNib {
    self.title = NSLocalizedString(@"IDS_ADDRESS_TAB", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Methods

// Set the localized strings.
- (void)localizeStrings {
    self.addressFormatLabel.text = NSLocalizedString(@"IDS_ADDRESS_FORMAT", nil);
    self.exampleLabel.text = NSLocalizedString(@"IDS_EXAMPLE", nil);
}

// Show the localized addresses.
- (void)showAddresses {
    // Get the current locale from our Swift code.
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:[LocaleViewController curLocale]];
    
    // Setup the address dictionary for the address format.
    NSString *street = NSLocalizedString(@"IDS_FORMAT_STREET", nil);
    NSString *city = NSLocalizedString(@"IDS_FORMAT_CITY", nil);
    NSString *state = NSLocalizedString(@"IDS_FORMAT_STATE", nil);
    NSString *zip = NSLocalizedString(@"IDS_FORMAT_ZIP", nil);
    NSString *country = NSLocalizedString(@"IDS_FORMAT_COUNTRY", nil);
    
    NSDictionary *addressComponents = @{(NSString *)kABPersonAddressStreetKey : street,
                                        (NSString *)kABPersonAddressCityKey : city,
                                        (NSString *)kABPersonAddressStateKey : state,
                                        (NSString *)kABPersonAddressZIPKey : zip,
                                        (NSString *)kABPersonAddressCountryKey : country,
                                        (NSString *)kABPersonAddressCountryCodeKey : [locale objectForKey:NSLocaleCountryCode]};
    
    self.addressFormatTextView.text = ABCreateStringWithAddressDictionary(addressComponents, NO);
    
    // Setup the address dictionary for the example.
    street = NSLocalizedString(@"IDS_EXAMPLE_STREET", nil);
    city = NSLocalizedString(@"IDS_EXAMPLE_CITY", nil);
    state = NSLocalizedString(@"IDS_EXAMPLE_STATE", nil);
    zip = NSLocalizedString(@"IDS_EXAMPLE_ZIP", nil);
    country = NSLocalizedString(@"IDS_EXAMPLE_COUNTRY", nil);
    
    addressComponents = @{(NSString *)kABPersonAddressStreetKey : street,
                          (NSString *)kABPersonAddressCityKey : city,
                          (NSString *)kABPersonAddressStateKey : state,
                          (NSString *)kABPersonAddressZIPKey : zip,
                          (NSString *)kABPersonAddressCountryKey : country,
                          (NSString *)kABPersonAddressCountryCodeKey : [locale objectForKey:NSLocaleCountryCode]};
    
    self.exampleTextView.text = ABCreateStringWithAddressDictionary(addressComponents, NO);
}

@end
