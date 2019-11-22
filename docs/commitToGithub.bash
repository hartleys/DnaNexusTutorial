#!/bin/bash

set -e

#eval $(ssh-agent -s)
#ssh-add ~/.ssh/ccad.github.v2.openssh
#NB
#git config --global user.email "stephen.hartley.phd@gmail.com"
#git config --global user.name "hartleys"

#source /mnt/nfs/gigantor/ifs/Shared/hartleys/software/igvSnap/IGV-snapshot-automator/versionStats.rc

source ./commitInfo.rc

#VERSION=$1

MOST_RECENT_COMMIT_ID=$(git log -1 | tail -n1 | sed 's/ //g' | cut -d'-' -f1)
if [ "$MOST_RECENT_COMMIT_ID" == "$VERSION" ]; then
   source ../commitCt.VAK.txt
   COMMITCT=$(( $COMMITCT + 1 ))
   COMMITCTSTRING="-$COMMITCT"
else
   COMMITCT=0
   COMMITCTSTRING=""
fi
echo "COMMITCT=${COMMITCT}" > ../commitCt.VAK.txt

echo "${VERSION}${COMMITCTSTRING}"

LOGFILE=../commitlogs.VAK/${VERSION}${COMMITCTSTRING}.log
echo "LOGFILE=$LOGFILE"


#cat    /mnt/nfs/gigantor/ifs/Shared/hartleys/software/IGV/IGV-snapshot-automator/versionStats.rc > $LOGFILE
echo "VERSION=$VERSION" | tee -a $LOGFILE
echo "MOST_RECENT_COMMIT_ID=${MOST_RECENT_COMMIT_ID}" 2>&1 | tee -a $LOGFILE
echo "COMPILE_TIME=\"$( cat ../vArmyKnife_tarballs/${VERSION}/README.md | head -n2 | tail -n1)\"" 2>&1 | tee -a $LOGFILE

rsync -a "../vArmyKnife_tarballs/${VERSION}/src" "./"
cp ../vArmyKnife_tarballs/${VERSION}/*.jar ./

echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git add:" 2>&1 | tee -a $LOGFILE
git add ./ 2>&1 | sed 's/^/    /g' | tee -a $LOGFILE


echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git status:" 2>&1 | tee -a $LOGFILE
git status ./ 2>&1 | sed 's/^/    /g' | tee -a ../commitlogs.VAK/${VERSION}.log

echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git commit:" 2>&1 | tee -a $LOGFILE
git commit -m "${VERSION}${COMMITCTSTRING}" 2>&1 | sed 's/^/    /g' | tee -a $LOGFILE

echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git push:" 2>&1 | tee -a $LOGFILE
git push 2>&1 | sed 's/^/    /g' | tee -a $LOGFILE



