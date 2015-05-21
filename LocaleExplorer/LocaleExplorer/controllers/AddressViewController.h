//
//  AddressViewController.h
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/20/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UIViewController

// Text Views that will be replaced with runtime values.
@property (weak, nonatomic) IBOutlet UITextView *addressFormatTextView;
@property (weak, nonatomic) IBOutlet UITextView *exampleTextView;

// IBOutlets for localizing the strings.
@property (weak, nonatomic) IBOutlet UILabel *addressFormatLabel;
@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;

@end
