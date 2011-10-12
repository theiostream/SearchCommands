include theos/makefiles/common.mk

BUNDLE_NAME = SearchCommandsPrefs
SearchCommandsPrefs_FILES = SearchCommandsPrefs.mm
SearchCommandsPrefs_INSTALL_PATH = /Library/PreferenceBundles
SearchCommandsPrefs_FRAMEWORKS = UIKit
SearchCommandsPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SearchCommandsPrefs.plist$(ECHO_END)
