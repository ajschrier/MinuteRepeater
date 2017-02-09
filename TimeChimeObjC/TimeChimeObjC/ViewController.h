//
//  ViewController.h
//  TimeChimeObjC
//
//  Created by AJ Schrier on 11/6/16.
//  Copyright © 2016 AJ Schrier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCTime.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *screenTap;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) TCTime *time;


@end

