// Settings -> SearchCommands Draft 2

#import <Preferences/Preferences.h>
#import <UIKit/UIKit.h>
#import <notify.h>

#define DYLIB_PATH @"/var/mobile/Library/SearchCommands"
#define PLIST_PATH @"/var/mobile/Library/SearchCommands/Preferences/pref.plist"
#define CURRENT_CRAP [[[[SCUtils dylibs] objectAtIndex:i] lastPathComponent] stringByDeletingPathExtension]

static NSMutableDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:PLIST_PATH];

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

@interface SearchCommandsPrefsListController: PSListController {}
- (NSArray *)getSpec;
@end

@implementation SearchCommandsPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self getSpec] retain];
	}
	return _specifiers;
}

- (NSArray *)getSpec {
	NSMutableArray *spec = [[NSMutableArray alloc] init];
	
	for (unsigned int i=0; i<[[SCUtils dylibs] count]; i++) {
		PSTextFieldSpecifier *tspec = [PSTextFieldSpecifier preferenceSpecifierNamed:CURRENT_CRAP
																			  target:self
																				 set:@selector(setString:forSpec:)
																				 get:@selector(stringForSpecifier:)
																			  detail:nil
																				cell:PSEditTextCell
																				edit:nil];
		[spec addObject:tspec];
	}
	
	return [NSArray arrayWithArray:spec];
}

- (void)setString:(id)str forSpec:(id)spec {
	[self setPreferenceValue:str specifier:spec];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[dict setObject:str forKey:[spec name]];
	[dict writeToFile:PLIST_PATH atomically:YES];
	
	NSLog(@"spec name: %@; defaults entry: %@", [spec name], [dict objectForKey:[spec name]]);
}

- (id)stringForSpecifier:(id)spec {
	return [dict objectForKey:[spec name]];
}
	
@end

// http://code.google.com/p/networkpx/wiki/PreferencesSpecifierPlistFormat is epic
// 