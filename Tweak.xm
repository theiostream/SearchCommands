// SearchCommands - Draft 1
// With simple dylib loading (already an enhancement to SpotEnhancer)

// NEXT GOAL: Make it better than SLShortcuts
// (note to self) REMEMBER TO MAKE IT FREE U IDIOT

#import <dlfcn.h>
#define DYLIB_PATH @"/var/mobile/Library/SearchCommands/"
#define PLIST_PATH @"/var/mobile/Library/SearchCommands/Preferences/pref.plist"
#define STRING_CRAP [[[SCUtils dylibs] objectAtIndex:i] stringByDeletingPathExtension]

@interface SBSearchController : NSObject {}
-(void)searchBarSearchButtonClicked:(UISearchBar *)clicked;
@end

@interface SCUtils : NSObject {}
+ (NSMutableArray *)dylibs;
@end

@implementation SCUtils
+ (NSMutableArray *)dylibs {
	NSMutableArray *d = [[NSMutableArray alloc] init];
	NSFileManager *fm = [[[NSFileManager alloc] init] autorelease];
	
	for (NSString *p in [fm contentsOfDirectoryAtPath:DYLIB_PATH error:nil]) {
		if ([[p pathExtension] isEqualToString:@"dylib"])
			[d addObject:p];
	}
	
	return d;
}
@end

%hook SBSearchController
- (void)searchBarSearchButtonClicked:(UISearchBar *)clicked {
	%orig;
	
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	
	for (unsigned int i=0; i<[[SCUtils dylibs] count]; i++) {
		void* handle = dlopen([[[NSString stringWithFormat:DYLIB_PATH] stringByAppendingString:[[SCUtils dylibs] objectAtIndex:i]] UTF8String], RTLD_LAZY);
		
		if (handle == NULL) {
			NSLog(@"[SearchCommands] 0_0 Error. Could not load dylib %@", [[SCUtils dylibs] objectAtIndex:i]);
			continue;
		}
		
		NSLog(@"[SearchCommands] Loaded %@", [[SCUtils dylibs] objectAtIndex:i]);
		
		void* cmdcallback = dlsym(handle, "SCCommand");
		if (cmdcallback == NULL) {
			NSLog(@"[SearchCommands] Error. Could not read function void* SCCommand(). Talk to the developer of %@ for troubleshooting.", [[SCUtils dylibs] objectAtIndex:i]);
			return;
		}
		
		NSString *cmd = (NSString *)((void* (*)(void)) cmdcallback)();
		
		NSLog(@"%@ is the key; %@ is the value", STRING_CRAP, [dict objectForKey:STRING_CRAP]);
		
		if ([dict objectForKey:STRING_CRAP]) {
			NSLog(@"[SearchCommands] kkkkk");
			cmd = [dict objectForKey:STRING_CRAP]; // If this single line works we are ready to upgrade to Draft2!
		}
		
		if ([[clicked text] isEqualToString:cmd]) {
			void* actioncallback = dlsym(handle, "SCAction");
			if (actioncallback == NULL) {
				NSLog(@"[SearchCommands] Error. Could not read function void SCAction(). Talk to the developer of %@ for troubleshooting.", [[SCUtils dylibs] objectAtIndex:i]);
				return;
			}
			
			((void (*)(void)) actioncallback)();
		}
		
		if (handle != NULL) dlclose(handle); // I don't know why to check... But always good to make sure :p
		if (dict != nil) [dict release];
	}
}
%end