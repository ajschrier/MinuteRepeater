//
//  ViewController.m
//  TimeChimeObjC
//
//  Created by AJ Schrier on 11/6/16.
//  Copyright © 2016 AJ Schrier. All rights reserved.
//

#import "ViewController.h"
#import "TCTime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Testing TCTime
    //TCTime *time = [[TCTime alloc] init];
    //NSLog(@"%@ %@", time.timeComponents[0], time.timeComponents[1]);
    _time = [[TCTime alloc] init];
    _timeLabel.text = @"Hello there";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)screenTapped:(id)sender {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, _time.timeComponents[0]);
}


@end
