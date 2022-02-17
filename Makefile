# Main make

TARGET_LIST= target1 \
             target2

TRUECMD=/bin/true
RUNMAKE=$(MAKE)
TARGETS_DIR=$(CURDIR)/targets
CODECHECKERCMD=./bash_script.sh
BUILDCMD=	($(CODECHECKERCMD) "$(TARGETS_DIR)/$(TARGET)" "$(TARGET)" "$(RUNMAKE)") &&
CLEANCMD=	(cd "$(TARGETS_DIR)/$(TARGET)" && $(RUNMAKE) clean) || $(TRUECMD)  &&

.PHONY: all
all:
	+$(foreach TARGET, $(TARGET_LIST), $(BUILDCMD)) $(TRUECMD)

.PHONY: clean
clean:
	+$(foreach TARGET, $(TARGET_LIST), $(CLEANCMD)) $(TRUECMD)
