//
//  ViewController.m
//  TestAccessoryManager
//
//  Created by Andrew Overton on 9/8/16.
//  Copyright © 2016 Overton. All rights reserved.
//

#import "ViewController.h"

#import <ExternalAccessory/ExternalAccessory.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *connectedAccessories;
@property (weak, nonatomic) IBOutlet UILabel *connectionState;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(updateForConnected:) name:EAAccessoryDidConnectNotification object:nil];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(updateForDisconnected:) name:EAAccessoryDidDisconnectNotification object:nil];

    [self refresh:nil];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (NSUInteger)connectedAccessoryCount {
    return [EAAccessoryManager sharedAccessoryManager].connectedAccessories.count;
}

- (IBAction)refresh:(id)sender {
    NSUInteger count = self.connectedAccessoryCount;
    self.connectedAccessories.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.connectedAccessoryCount];
    count == 0 ? [self updateForDisconnected:nil] : [self updateForConnected:nil];
}

- (void)updateForConnected:(id)sender {
    self.connectionState.text = @"Connected";
    self.connectionState.textColor = UIColor.greenColor;
}

- (void)updateForDisconnected:(id)sender {
    self.connectionState.text = @"Disconnected";
    self.connectionState.textColor = UIColor.redColor;
}

@end
