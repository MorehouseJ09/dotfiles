#!/bin/sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set repeat.wait 50
/bin/echo -n .
$cli set parameter.keyoverlaidmodifier_timeout 150
/bin/echo -n .
$cli set repeat.keyoverlaidmodifier_initial_wait 100
/bin/echo -n .
$cli set bilalh.remap.f19_escape_control 1
/bin/echo -n .
/bin/echo
