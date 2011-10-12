THEOS_DEVICE_IP=192.168.1.106

include theos/makefiles/common.mk

TWEAK_NAME = SearchCommands
SearchCommands_FILES = Tweak.xm
SUBPROJECTS = searchcommandsdylibs searchcommandsprefs

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
