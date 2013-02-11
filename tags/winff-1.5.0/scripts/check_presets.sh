#!/bin/bash

# Script to test the presets. It test if the presets can be run
# on the current version of ffmpeg. The functional presets are
# copied to a new file.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Copyright: Paul Gevers <paul@climbing.nl>, 2008-2012

# Stop if an error occurs
set -e

# Default variables/properties (will be overridden when parameters are used).
PRESET_FILE="../presets.xml"
TEST_FILE=`pwd`"/test.avi"
TEMP_DIR=`mktemp --directory --tmpdir winff.XXXXXX`
FFMPEG="/usr/bin/ffmpeg"
#FFMPEG="/usr/bin/avconv"
LOGFILE="check.log"
RUNFILE="run_ffmpeg"
SORT_ONLY="false"
OLD_LINE=""
PRESET=""

# Function for showing help text how to use this program
helpText()
{
    echo ""
    echo
    echo "    $0 "
    echo "        Test script to check if the specified executable can process the"
    echo "        the specified test file with all the presets available. It returns"
    echo "        two files: processed_* and checked_*, which contain the presets file"
    echo "        as sorted by xmlstarlet (e.g. alphabetically sorted), and the successful"
    echo "        presets respectively."
    echo
    echo "        -c"
    echo "        --command   : The location of executable to test."
    echo "        -d"
    echo "        --dir       : The location of the temporary work directory."
    echo "        -f"
    echo "        --file      : The location of the presets-file."
    echo "        -t"
    echo "        --test      : The location of the test movie."
    echo "        -s"
    echo "        --sort-only : Only output reordered preset file, e.g. for comparison."
    echo "        -h"
    echo "        --help      : This help text"
    echo
    echo "    Example: $0 --command=$FFMPEG --dir=$TEMP_DIR --file=$PRESET_FILE --test=$TEST_FILE"
    echo
}


# Check for parameters and convert them to the correct variables
# Parse arguments
TEMP=$(getopt -n check_presets \
--options c:,d:,f:,t:,s,h \
--longoptions command:,dir:,file:,test:,sort-only,help \
-- "$@")

eval set -- "$TEMP"
while true; do
    case $1 in 
        -c | --command)
            FFMPEG="$2"
	    shift
            ;;
	-d | --dir)
	    TEMP_DIR="$2"
	    shift
            ;;
	-f | --file )
	    PRESET_FILE="$2"
	    shift
            ;;
	-t | --test )
	    TEST_FILE="$2"
	    shift
            ;;
	-s | --sort-only )
	    SORT_ONLY="true"
            ;;
	-h | --help )
	    helpText
            exit 0
	    ;;
        --)                                                                 
            # no more arguments to parse                                
            break                                                       
            ;;    
	*   )
	    echo Unknown parameter or inproper use: "$PARAM"
            helpText
            exit 0
	    ;;
    esac
    shift
done

# Test if work directory exist; else make it
if [[ ! -d $TEMP_DIR ]] ; then
    echo -n "Working directory \"${TEMP_DIR}\" did not exist, creating it..."
    mkdir $TEMP_DIR
    echo "done."
fi
if [[ ! -d ${TEMP_DIR}/logs ]] ; then
    echo -n "Creating \"${TEMP_DIR}/logs\" ..."
    mkdir ${TEMP_DIR}/logs
    echo "done."
fi

# Copy the preset file to the working directory so that all the work can be done locally
cp ${PRESET_FILE} ${TEMP_DIR} 

# Some cleanup of the variables (and stripping off the path of the preset file).
TEMP_DIR=${TEMP_DIR%/}
PRESET_FILE=${PRESET_FILE##*/}

# Test if xmlstarlet exists
if [[ ! -x $(which xmlstarlet) ]] ; then
    echo "For this script to run succesfully you need to install xmlstarlet."
    exit 1
fi

# Move over to the working directory
cd $TEMP_DIR

# Creating empty preset files
xmlstarlet ed --delete "/presets/*" $PRESET_FILE > processed_${PRESET_FILE}
xmlstarlet ed --delete "/presets/*" $PRESET_FILE > checked_${PRESET_FILE}

# Create batch file to run ffmpeg/avconv on all presets
echo > $RUNFILE
xmlstarlet el -d2 "$PRESET_FILE" | \
    while read LINE ; do
    if (( "${#LINE}" > 8 )) ; then
	PRESET="${LINE#presets/}"
	LABEL=`xmlstarlet sel -T -t -m "$LINE" -v label "$PRESET_FILE"`
	PARAMS=`xmlstarlet sel -T -t -m "$LINE" -v params "$PRESET_FILE"`
	EXTENSION=`xmlstarlet sel -T -t -m "$LINE" -v extension -o "|" "$PRESET_FILE"`
	CATEGORY=`xmlstarlet sel -T -t -m "$LINE" -v category "$PRESET_FILE"`
	EXTENSION="${EXTENSION%|}"
	EXTENSION_TEST=`echo "$EXTENSION" | tr -s \| _`

	if [[ "$EXTENSION_TEST" != "$EXTENSION" ]]; then 
	    echo
	    echo "###########################################"
	    echo
	    echo "   WARNING: Preset $PRESET is not unique."
	    echo
	    echo "###########################################"
	    echo
	else
	    echo Processing preset "$PRESET"

	    # Creating the script to really try all presets with ffmpeg
    	    echo "echo -n . > /dev/stderr " >> $RUNFILE
    	    echo "echo -n preset = $PRESET :\ " >> $RUNFILE
	    echo "{ { $FFMPEG -i \"$TEST_FILE\" $PARAMS -y -t 1 test.$EXTENSION \
                 2>&1 && echo passed ; } || echo failed ; } | \
                 cat > logs/$PRESET.$LOGFILE" >> $RUNFILE
	    echo "tail -n1 logs/$PRESET.$LOGFILE" >> $RUNFILE

	    # Writing sorted presets file for easy comparing with result file
	    xmlstarlet ed --inplace --subnode /presets -t elem -n ${LINE#presets/} -v "" \
		checked_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /$LINE -t elem -n label \
		-v "$LABEL" checked_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /$LINE -t elem -n params \
		-v "$PARAMS" checked_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /$LINE -t elem -n extension \
		-v "$EXTENSION" checked_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /$LINE -t elem -n category \
		-v "$CATEGORY" checked_${PRESET_FILE}
	fi
    fi
done 

if [[ $SORT_ONLY == "false" ]] ; then
    echo -n Running ffmpeg/avconv, this may take a while
    # Preventing problems with () in names and presets
    sed "s/(/\\\(/g;s/)/\\\)/g" $RUNFILE > x$RUNFILE
    mv x$RUNFILE $RUNFILE
    sh $RUNFILE > result.txt
    rm -f test.*
    echo done.

    # Only add the presets that worked in our final version
    grep -e": passed" \
	result.txt | awk '{print $3}' | 
    while read LINE ; do
	echo "Updating processed_${PRESET_FILE} with preset $LINE."
	LABEL=`xmlstarlet sel -T -t -m "presets/$LINE" -v label "$PRESET_FILE"`
	PARAMS=`xmlstarlet sel -T -t -m presets/"$LINE" -v params "$PRESET_FILE"`
	EXTENSION=`xmlstarlet sel -T -t -m presets/"$LINE" -v extension \
	    -o "|" "$PRESET_FILE"`
	CATEGORY=`xmlstarlet sel -T -t -m presets/"$LINE" -v category \
	    "$PRESET_FILE"`
	EXTENSION="${EXTENSION%|}"
	EXTENSION_TEST=`echo "$EXTENSION" | tr -s \| _`
	
	if [[ "$EXTENSION_TEST" == "$EXTENSION" ]]; then 
	    xmlstarlet ed --inplace --subnode /presets -t elem -n $LINE -v "" \
		processed_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /presets/$LINE -t elem -n label \
		-v "$LABEL" processed_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /presets/$LINE -t elem -n params \
		-v "$PARAMS" processed_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /presets/$LINE -t elem -n extension \
		-v "$EXTENSION" processed_${PRESET_FILE}
	    xmlstarlet ed --inplace --subnode /presets/$LINE -t elem -n category \
		-v "$CATEGORY" processed_${PRESET_FILE}
	fi
    done
fi

echo "Result can be found in ${TEMP_DIR}"
