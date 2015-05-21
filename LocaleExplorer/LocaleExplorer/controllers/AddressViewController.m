//
//  AddressViewController.m
//  LocaleExplorer
//
//  Created by Kaho Lo on 5/20/15.
//  Copyright (c) 2015 Kaho Lo. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// The strings used for the tabs can only be set in awakeFromNib(), not in viewDidLoad().
- (void)awakeFromNib {
    self.title = NSLocalizedString(@"IDS_ADDRESS_TAB", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
