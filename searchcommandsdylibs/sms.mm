extern "C" void* SCCommand() {
	return @"New SMS";
}

extern "C" void SCAction() {
	[[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:+"]]];
}