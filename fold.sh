#!/bin/bash
####
# Copyright (c) 2015 Chris J Daly (github user cjdaly)
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#   cjdaly - initial API and implementation
####

java -jar eclipse/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar \
 -consoleLog -clean \
 -vmargs \
 -Xms40m -Xmx256m
