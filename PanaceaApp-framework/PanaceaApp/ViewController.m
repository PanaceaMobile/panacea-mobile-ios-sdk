//
//  ViewController.m
//  PanaceaApp
//
//  Created by Jacques Questiaux on 2013/11/05.
//  Copyright (c) 2013 Cobiinteractive. All rights reserved.
//

#import "ViewController.h"
#import "Panacea.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRegisterResponse:) name:PM_NOTIFICATION_REGISTER object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRegisterError:) name:PM_ERROR object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPanaceaInboxButtonPressed:(id)sender {
    
    [[Panacea sharedInstance] showPanaceaInboxFromViewController:self];
    [self.activityIndicator startAnimating];
}

- (void) handleRegisterResponse: (NSNotification*) notification {
    
    [self.activityIndicator stopAnimating];
}

- (void) handleRegisterError: (NSNotification*) notification {
    
    [self.activityIndicator stopAnimating];
}

@end
