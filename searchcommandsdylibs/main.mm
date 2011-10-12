#import <Foundation/Foundation.h>

NSString* SCCommand() {
	return @"Test";
}

void SCAction() {
	NSLog(@"I guess the answer for the question above is NO so I better NSLog() this...");
}

int main() {
	NSLog(@"Ohai!");
	return 0;
}

// If this gets compiled at my first try; this is a miracle.
// It didn't