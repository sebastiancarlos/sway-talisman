#### Start of standard makefile configuration. ####

SHELL := /usr/bin/env bash
LN_S := ln -sf

# Root of the installation
prefix := /usr/local

# Root of the executables
exec_prefix := $(prefix)

# Executables
bindir := $(exec_prefix)/bin

# Set space as the recipe prefix, instead of tab
# Note: It also works with multiple spaces before the recipe text
empty :=
space := $(empty) $(empty)
.RECIPEPREFIX := $(space) $(space)

# Enable delete on error, which is disabled by default for legacy reasons
.DELETE_ON_ERROR:

#### End of standard makefile configuration. ####

# Project specific absolute path
srcdir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

green := \\e[32m
blue := \\e[34m
bold := \\e[1m
reset := \\e[0m

.PHONY: all
all: install

.PHONY: install
install: installdirs
  @echo -e $(blue)Installing sway-talisman$(reset)
  @$(LN_S) $(srcdir)/sway-launch $(DESTDIR)$(bindir)/sway-launch
  @echo -e '   'Installing $(green)sway-launch$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @$(LN_S) $(srcdir)/sway-get-current-workspace $(DESTDIR)$(bindir)/sway-get-current-workspace
  @echo -e '   'Installing $(green)sway-get-current-workspace$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @$(LN_S) $(srcdir)/sway-get-next-empty-workspace $(DESTDIR)$(bindir)/sway-get-next-empty-workspace
  @echo -e '   'Installing $(green)sway-get-next-empty-workspace$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @$(LN_S) $(srcdir)/sway-is-scratchpad-focused $(DESTDIR)$(bindir)/sway-is-scratchpad-focused
  @echo -e '   'Installing $(green)sway-is-scratchpad-focused$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @$(LN_S) $(srcdir)/sway-move-to-scratchpad $(DESTDIR)$(bindir)/sway-move-to-scratchpad
  @echo -e '   'Installing $(green)sway-move-to-scratchpad$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @$(LN_S) $(srcdir)/sway-scratchpad-toggle $(DESTDIR)$(bindir)/sway-scratchpad-toggle
  @echo -e '   'Installing $(green)sway-scratchpad-toggle$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @$(LN_S) $(srcdir)/sway-workspace $(DESTDIR)$(bindir)/sway-workspace
  @echo -e '   'Installing $(green)sway-workspace$(reset) in $(green)$(DESTDIR)$(bindir)/$(reset)
  @echo -e $(blue)Installing$(reset) $(green)DONE$(reset)

.PHONY: installdirs
installdirs:
  @echo -e $(blue)Creating directories ...$(reset)
  @mkdir -p $(DESTDIR)$(bindir)
  @echo -e '   'Creating directory $(green)$(DESTDIR)$(bindir)$(reset)
  @echo -e $(blue)Creating directories$(reset) $(green)DONE$(reset)\\n

.PHONY: uninstall
uninstall:
  @echo -e $(blue)Uninstalling sway-talisman$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-get-current-workspace 
  @echo -e '   'Deleting $(green)sway-get-current-workspace$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-get-next-empty-workspace 
  @echo -e '   'Deleting $(green)sway-get-next-empty-workspace$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-is-scratchpad-focused 
  @echo -e '   'Deleting $(green)sway-is-scratchpad-focused$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-move-to-scratchpad 
  @echo -e '   'Deleting $(green)sway-move-to-scratchpad$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-scratchpad-toggle 
  @echo -e '   'Deleting $(green)sway-scratchpad-toggle$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-workspace 
  @echo -e '   'Deleting $(green)sway-workspace$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @rm -f $(DESTDIR)$(bindir)/sway-launch 
  @echo -e '   'Deleting $(green)sway-launch$(reset) from $(green)$(DESTDIR)$(bindir)/$(reset)
  @echo -e $(green)Uninstalling DONE$(reset)
