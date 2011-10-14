// == Get Date Plugin

extern "C" void* SCCommand() {
	return @"Date";
}

extern "C" void SCAction() {
	NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
	[dateFor setDateStyle:NSDateFormatterNoStyle];
	[dateFor setTimeStyle:NSDateFormatterShortStyle];
	[dateFor setDateFormat:@"dd-MM-YYYY"];
	NSString *currentTime = [dateFor stringFromDate:[NSDate date]];
	[dateFor release];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current date" message:currentTime delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}