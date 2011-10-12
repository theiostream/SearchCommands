#import <Foundation/Foundation.h>

extern "C" void* SCCommand() {
	return @"Test";
}

extern "C" void SCAction() {
	NSLog(@"I guess the answer for the question above is NO so I better NSLog() this...");
}

extern "C" int testFunc() {
	return 12345678;
}

int main() {
	NSLog(@"Ohai!");
	return 0;
}

// If this gets compiled at my first try; this is a miracle.
// It didn't