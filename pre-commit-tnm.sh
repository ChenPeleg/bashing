#!/bin/sh
#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.

#  Variable Definitions

 # The json file where the version change will be
#folder="../../"

#debug true | false
dubug="false"


verFileName="./src/app/Services/versions/app.version.json"
verFileNameInTechUpgradeFiles="../src/app/Services/versions/app.version.json"

if [ "$dubug" = "true" ]
    then
    verFileName="$verFileNameInTechUpgradeFiles"
fi
 # The json base text file if the file is empty or none existant
defaultFileText="{\"version\":\"1.1.0\"}"
# INCREMENT - increments minor version by 1
# DATE - set minor version to todays date in mmdd format
updateType="DATE"

#cd $folder
fileText=`cat $verFileName`
orgFileText=$fileText
stringLength=${#fileText}
if ((stringLength < 3))
    then fileText="$defaultFileText"
    echo "No version file found. Creating new file."
fi

regMinorVer='([0-9]{1,30}\.[0-9]{1,30})\.([0-9]{1,30})'

[[ $fileText =~ $regMinorVer ]]

fullVersionText="${BASH_REMATCH[0]}"
majorVersionText="${BASH_REMATCH[1]}"
originalMinorVersion="${BASH_REMATCH[2]}"
#newMinorVersion=$((originalMinorVersion+1))
originalMinorVersionNoTralingZeros=${originalMinorVersion#0}
 
newMinorVersion=$((originalMinorVersionNoTralingZeros+1))


currentDate=$(date '+%m%d')

# echo "Date : $currentDate"




 if  [ "$updateType" = "DATE" ]
     then newMinorVersion="$currentDate"
 fi


oldVersion="$majorVersionText.$originalMinorVersion"
newVersion="$majorVersionText.$newMinorVersion"


if [ "$dubug" = "true" ]
    then
     echo "orgFileText $orgFileText"
     echo "fullVersionText $fullVersionText"
     echo "majorVersionText $majorVersionText"
     echo "old version $oldVersion"
     echo "newVersion $newVersion"
     #echo "minor $originalMinorVersion"

      echo "original minor $originalMinorVersion"
      echo "new minor $newMinorVersion"
      echo
      echo "Minor version upgraded from $originalMinorVersion to $newMinorVersion"
      echo "New version $newVersion"
      echo
      echo
fi

#$newFileText =

#  if [ "$fileText" = "$orgFileText" ]
#  then
#  echo "No version changes"
#  else

#  echo "${fileText/"$oldVersion"/"$newVersion"}" > "$verFileName"
#  echo "Minor version upgraded from $originalMinorVersion to $newMinorVersion"
#  echo "New version $newVersion"
#  fi
if [ $oldVersion = $newVersion ]
  then
    echo "Version number $oldVersion correct,"
    echo "No update needed."
  else
  echo "${fileText/"$oldVersion"/"$newVersion"}" > "$verFileName"
fi

if [ "$dubug" = "true" ]
    then
    read -t10 -n1 -r -p 'Press any key in the next ten seconds...' key
fi
