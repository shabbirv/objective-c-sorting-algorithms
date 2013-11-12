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
    /////////////////////////////////////
    //Algorithms
    /////////////////////////////////////
    
    //Merge Sort
    [self merge];
    
    //Fibonacci sequenece iterative
    [self fibonacci:6];
    
    //Fibonacci Sequence Recursive
    NSLog(@"%d", [self fibRecurs:6]);
    
    //Check if all characters in the string are unique
    if ([self hasUniqueCharacters:@"hello"]) {
        NSLog(@"Unique");
    } else {
        NSLog(@"Not unique");
    }
    
    //Checks if two strings are anagrams of each other
    if (anagrams(@"army", @"mary")) {
        NSLog(@"Are anagrams");
    } else {
        NSLog(@"Not anagrams");
    }
    
    return YES;
}

- (BOOL)uniqueCharacters:(NSString *)string {
    BOOL set[256];
    for (int i = 0; i < 256; i++){
        set[i] = NO;
    }
    for (int i = 0; i < string.length; i++) {
        int num = [string characterAtIndex:i];
        if (set[num] == TRUE) return FALSE;
        
        set[num] = TRUE;
    }
    return TRUE;
}

- (BOOL)hasUniqueCharacters:(NSString *)string {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	for (int i = 0; i < string.length; i++) {
		char c = [string characterAtIndex:i];
		int num = [dict[@(c)] intValue];
		dict[@(c)] = @(num + 1);
	}
    
	for (int i = 0; i < string.length; i++) {
		char c = [string characterAtIndex:i];
		int num = [dict[@(c)] intValue];
		if (num > 1)
			return FALSE;
	}
    
	return TRUE;
    
}

- (void)merge {
	NSMutableArray *array1 = [NSMutableArray arrayWithArray:@[@(1), @(12), @(3), @(15), @(4)]];
	NSMutableArray *array2 = [NSMutableArray arrayWithArray:@[@(5), @(4), @(3), @(2), @(9)]];
	[array1 sortUsingSelector:@selector(compare:)];
	[array2 sortUsingSelector:@selector(compare:)];
    
	NSMutableArray *merged = [NSMutableArray array];
	int a = 0;
	int b = 0;
	while (a < array1.count && b < array2.count) {
		if (array1[a] < array2[b]) {
			[merged addObject:array1[a]];
			a++;
		} else if (array1[a] > array2[b]) {
			[merged addObject:array2[b]];
			b++;
		} else {
			[merged addObject:array1[a]];
			[merged addObject:array2[b]];
			a++;
			b++;
		}
	}
    
	while (a < array1.count) {
		[merged addObject:array1[a]];
		a++;
	}
    
	while (b < array2.count) {
		[merged addObject:array1[b]];
		b++;
	}
    
	NSLog(@"%@", merged);
    
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

- (void)fibonacci:(int)n {
    NSMutableArray *fib = [NSMutableArray array];
    fib[0] = @(0);
    fib[1] = @(1);
    for (int i = 2; i <= n; i ++) {
        fib[i] = @([fib[i - 1] intValue] + [fib[i - 2] intValue]);
    }
    NSLog(@"%d", [fib[n] intValue]);
}

- (int)fibRecurs:(int)n {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    
    return [self fibRecurs:n - 2] + [self fibRecurs:n - 1];
}


BOOL anagrams(NSString *a, NSString *b) {
	if (a.length != b.length)
		return NO;
    
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	NSUInteger length = a.length;
	for (int i = 0; i < length; i++) {
		char c = [a characterAtIndex:i];
		int num = [dict[@(c)] intValue];
		dict[@(c)] = @(num + 1);
	}
    
	for (int i = 0; i < length; i++) {
		char c = [b characterAtIndex:i];
		int num = [dict[@(c)] intValue];
		dict[@(c)] = @(num - 1);
	}
    
	for (NSNumber *charNum in dict.allKeys) {
		char c = charNum.charValue;
		int num = [dict[@(c)] intValue];
		if (num != 0)
			return NO;
	}
    
    
	return YES;
}

- (char)firstNonRepeated:(NSString *)string {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < string.length; i++) {
        char c = [string characterAtIndex:i];
        int num = [dict[@(c)] intValue];
        dict[@(c)] = @(num + 1);
    }
    for (int i = 0; i < string.length; i++) {
        char c = [string characterAtIndex:i];
        int num = [dict[@(c)] intValue];
        if (num == 1)
            return c;
    }
    return '\0';
}

- (void)reverseString:(NSString *)string {
    NSMutableArray *reversed = [NSMutableArray array];
    NSArray *array = [string componentsSeparatedByString:@" "];
    for (int i = 0; i < array.count; i++) {
        [reversed addObject:array[(array.count - 1) - i]];
    }
    NSString *reversedString = [reversed componentsJoinedByString:@" "];
    NSLog(@"%@", reversedString);
}

BOOL anagram(NSString *a, NSString *b) {
    
    if (a.length != b.length)
        return NO;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < a.length; i++) {
        char c1 = [a characterAtIndex:i];
        int num = [dict[@(c1)] intValue];
        dict[@(c1)] = @(num + 1);
    }
    
    for (int i = 0; i < b.length; i++) {
        char c2 = [b characterAtIndex:i];
        int num = [dict[@(c2)] intValue];
        dict[@(c2)] = @(num - 1);
    }
    
    for (NSNumber *i in dict.allKeys) {
        char c = i.charValue;
        if ([dict[@(c)] intValue] != 0)
            return NO;
    }
    
    return YES;
}


@end
