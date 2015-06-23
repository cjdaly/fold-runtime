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

TIMESTAMP=`date +%Y%m%d-%H%M%S`

FOLD_PID_FILE="fold.PID"

# http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
FOLD_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$1" in
  start)
  if [ -f "$FOLD_PID_FILE" ]; then
    FOLD_PID=`cat $FOLD_PID_FILE`
    echo "Fold process $FOLD_PID already running."
  else
    FOLD_SYSTEM_DIR=$2
    echo "Fold system dir: $FOLD_SYSTEM_DIR"
    
    # log setup
    FOLD_LOGS_DIR="logs"
    mkdir -p $FOLD_LOGS_DIR
    FOLD_LOG="$FOLD_LOGS_DIR/fold-$TIMESTAMP.log"
    touch $FOLD_LOG
    rm -f fold.log
    ln -s $FOLD_LOG fold.log
    
    # launch eclipse
    java -jar $FOLD_HOME/eclipse/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar \
     -consoleLog -clean \
     -data $FOLD_HOME/data/eclipse/workspace \
     -vmargs \
     -Xms40m -Xmx256m \
     1>> $FOLD_LOG 2>&1 &
    
    FOLD_PID=$!
    
    echo "$FOLD_PID" > $FOLD_PID_FILE
    echo "Fold process: $FOLD_PID" >> $FOLD_LOG
    echo "Fold process: $FOLD_PID"
    echo "Fold log: ./fold.log -> $FOLD_LOG"
  fi
  ;;
  stop)
  if [ -f "$FOLD_PID_FILE" ]; then
    FOLD_PID=`cat $FOLD_PID_FILE`
    rm $FOLD_PID_FILE
    echo "Fold process $FOLD_PID now shutting down."
    kill $FOLD_PID
    tail -f fold.log --pid=$FOLD_PID
  else
    echo "Fold already stopped or stopping."
  fi
  ;;
  status)
  if [ -f "$FOLD_PID_FILE" ]; then
    FOLD_PID=`cat $FOLD_PID_FILE`
    echo "Fold process $FOLD_PID apparently running."
  else
    echo "Fold stopped or stopping."
  fi
  ;;
  *)
  echo "Fold usage:"
  echo "  ./fold.sh start"
  echo "  ./fold.sh stop"
  echo "  ./fold.sh status"
  ;;
esac

