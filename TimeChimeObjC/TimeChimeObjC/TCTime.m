//
//  TCTime.m
//  TimeChimeObjC
//
//  Created by AJ Schrier on 11/6/16.
//  Copyright © 2016 AJ Schrier. All rights reserved.
//

#import "TCTime.h"

@implementation TCTime

- (NSArray *) getTimeElements {
    return _timeComponents;
}

- (id) init {
    NSLog(@"%s init new TCTime", __PRETTY_FUNCTION__);
    self = [super init];
    NSDate *time = [NSDate date];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    dateformatter.dateStyle = NSDateFormatterNoStyle;
    dateformatter.timeStyle = NSDateFormatterMediumStyle;
    
    _timeComponents = [[dateformatter stringFromDate:time] componentsSeparatedByString:@":"];
    
    _hours = [_timeComponents[0] integerValue];
    _minutes = [_timeComponents[1] integerValue];
    _seconds = [_timeComponents[2] integerValue];
    
    return self;
}
@end


