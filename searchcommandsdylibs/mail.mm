extern "C" void* SCCommand() {
	return @"New Mail";
}

extern "C" void SCAction() {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:"]]];
}