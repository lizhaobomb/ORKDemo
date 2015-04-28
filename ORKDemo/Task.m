//
//  Task.m
//  ORKDemo
//
//  Created by lizhao on 15/4/28.
//  Copyright (c) 2015年 lizhao. All rights reserved.
//

#import "Task.h"

@implementation Task

- (ORKOrderedTask *)fitnessTask {
    return [ORKOrderedTask fitnessCheckTaskWithIdentifier:@"WalkingTask" intendedUseDescription:@"For this task you will need to walk as fast as you can for five minutes" walkDuration:300 restDuration:300 options:ORKPredefinedTaskOptionNone];
}

@end
