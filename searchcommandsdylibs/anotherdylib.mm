#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

extern "C" void* SCCommand() {
	return @"Another";
}

extern "C" void SCAction() {
	UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Test" message:@"asd" delegate:nil cancelButtonTitle:@"asdasd" otherButtonTitles:nil];
	[av show];
	[av release];
}