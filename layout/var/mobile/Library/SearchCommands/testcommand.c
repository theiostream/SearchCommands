#include <stdio.h>
#import <Headers/NSObject.h>
#import <Headers/NSObjCRuntime.h>
#import <Headers/NSString.h>

NSString* SCCommand() {
	return @"Test";
}

void* SCAction() {
	printf("HEY THERE HOW ARE YOU ARE YOU SEEING THIS?");
	NSLog(@"I guess the answer for the question above is NO so I better NSLog() this...");
}

// If this gets compiled at my first try; this is a miracle.
// ^^ also thx BigBoss.