extern "C" void* SCCommand() {
	return @"Time";
}

extern "C" void SCAction() {
	NSDateFormatter *dt = [[NSDateFormatter alloc] init];
	[dt setDateStyle:NSDateFormatterNoStyle];
	[dt setTimeStyle:NSDateFormatterShortStyle];
	[dt setDateFormat:@"HH:mm:ss"];
	NSString *currentHour = [dt stringFromDate:[NSDate date]];
    [dt release];

	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Current time" message:currentHour delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}