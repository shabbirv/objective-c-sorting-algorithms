//
//  AppDelegate.m
//  Algorithms
//
//  Created by Shabbir Vijapura on 10/20/13.
//  Copyright (c) 2013 Shabbir Vijapura. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self mergeSort];
    
    return YES;
}

- (void)mergeSort {
    NSMutableArray *array1 = [NSMutableArray arrayWithArray:@[@(5), @(4), @(12), @(1), @(47)]];
    NSMutableArray *array2 = [NSMutableArray arrayWithArray:@[@(10), @(12), @(30), @(40), @(44)]];
    [array1 sortUsingSelector:@selector(compare:)]; //Sort the first array
    [array2 sortUsingSelector:@selector(compare:)]; // Sort the second array
    NSMutableArray *merged = [NSMutableArray array]; // Create container array for merged numbers
    int a = 0;
    int b = 0;
    while (a < array1.count && b < array2.count) {
        if ([array1[a] intValue] < [array2[b] intValue]) {
            [merged addObject:array1[a]];
            a++;
        } else if ([array2[b] intValue] < [array1[a] intValue]) {
            [merged addObject:array2[b]];
            b++;
        } else {
            [merged addObject:array1[a]];
            [merged addObject:array2[b]];
            a++;
            b++;
        }
    }
    
    while (a < array1.count) { //Add any leftover numbers (they will be sorted)
        [merged addObject:array1[a]];
        a++;
    }
    
    while (b < array2.count) { //Add any leftover numbers (they will be sorted)
        [merged addObject:array2[b]];
        b++;
    }
    
    NSLog(@"%@", merged);
}

@end