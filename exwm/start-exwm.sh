#!/bin/sh

# NOTE: This is only for live demo, not needed for your conf
#spice-vdagent only used for virtual machine

# Fire it up

exec dbus-launch --exit-with-session emacs -mm --debug-init
