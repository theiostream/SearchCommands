CC=gcc
LD=$(CC)
LDFLAGS=-lobjc -dynamiclib -bind_at_load -isysroot /var/sdk -F/System/Library/PrivateFrameworks -F/System/Library/Frameworks -framework CoreFoundation -framework Foundation
CFLAGS=-fconstant-cfstrings -std=gnu99 -Wall -O2 -I/usr/include -I/System/Library/Frameworks/Foundation.framework --sysroot=/var/sdk
VERSION=1.0


all:	hide.dylib

hide.dylib:	testcommand.o
	$(LD) $(LDFLAGS) -o $@ $^
	/usr/bin/ldid -S hide.dylib
	rm -f *.o

%.o: %.m
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

clean:
	rm -f *.o edge
