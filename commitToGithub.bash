#!/bin/bash

set -e

#eval $(ssh-agent -s)
#ssh-add ~/.ssh/ccad.github.v2.openssh
#NB
#git config --global user.email "stephen.hartley.phd@gmail.com"
#git config --global user.name "hartleys"

#source /mnt/nfs/gigantor/ifs/Shared/hartleys/software/igvSnap/IGV-snapshot-automator/versionStats.rc


export NEWVERSION=$1
source ./commitInfo.rc

mv commitInfo.rc commitLogs/commitInfo.${VERSION}.rc

if [ "$NEWVERSION" == "." ]; then
  echo "Autodetecting version";
  MAJORMINOR=$( echo ${VERSION} | tr '.' $'\t' | cut -f1-2 | tr $'\t' '.')
  LEASTVER=$(( $( echo ${VERSION} | tr '.' $'\t' | cut -f3 ) + 1 ))
  export NEWVERSION="${MAJORMINOR}.${LEASTVER}"
fi
export VERSION=$NEWVERSION

export FULLDATE=$(date)
export FULLDATESEC=$(date --date="$FULLDATE" +%s)
export DATE=$(date +"%Y-%m-%d" --date="$FULLDATE")
export DATETEXT=$(date +"%B %d, %Y" --date="$FULLDATE")

echo "export VERSION=\"$VERSION\""         | tee     commitInfo.rc
echo "export FULLDATE=\"$FULLDATE\""       | tee -a  commitInfo.rc
echo "export FULLDATESEC=\"$FULLDATESEC\"" | tee -a  commitInfo.rc
echo "export DATE=\"$DATE\""               | tee -a  commitInfo.rc
echo "export DATETEXT=\"$DATETEXT\""       | tee -a  commitInfo.rc


MOST_RECENT_COMMIT_ID=$(git log -1 | tail -n1 | sed 's/ //g' | cut -d'-' -f1)
if [ "$MOST_RECENT_COMMIT_ID" == "$VERSION" ]; then
   COMMITCT=$(( $COMMITCT + 1 ))
   COMMITCTSTRING="-$COMMITCT"
else
   COMMITCT=0
   COMMITCTSTRING=""
fi
export FULLVERSION=${VERSION}${COMMITCTSTRING}
echo "export COMMITCT=${COMMITCT}"        >>  commitInfo.rc
echo "export FULLVERSION=${FULLVERSION}"  >>  commitInfo.rc

LOGFILE=./commitLogs/${FULLVERSION}.log
echo "LOGFILE=$LOGFILE"


echo "###################" > $LOGFILE
cat commitInfo.rc >> $LOGFILE

echo "###################" > $LOGFILE

cd doc
./buildScripts.bash

echo "###################" >> $LOGFILE
echo "" >> $LOGFILE
echo "git add:" 2>&1 | tee -a $LOGFILE
git add ./  2>&1 | sed 's/^/    /g' | tee -a $LOGFILE
git add ./* 2>&1 | sed 's/^/    /g' | tee -a $LOGFILE


echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git status:" 2>&1 | tee -a $LOGFILE
git status ./ 2>&1 | sed 's/^/    /g' | tee -a ../commitlogs.VAK/${VERSION}.log

echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git commit:" 2>&1 | tee -a $LOGFILE
git commit -m "${FULLVERSION}" 2>&1 | sed 's/^/    /g' | tee -a $LOGFILE

echo "" >> $LOGFILE
echo "" >> $LOGFILE
echo "git push:" 2>&1 | tee -a $LOGFILE
git push 2>&1 | sed 's/^/    /g' | tee -a $LOGFILE



