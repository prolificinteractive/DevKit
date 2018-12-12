#/bin/bash

VERSION=$1
OUTPUT_DIRECTORY=$2
SWIFTLINT_CLONE_URL="git@github.com:prolificinteractive/swiftlint"
CLONE_DIRECTORY=/tmp/swiftlint

if [ -f ${OUTPUT_DIRECTORY}/swiftlint ]; then 
	echo "Swiftlint found; skipping install."
	exit 0
fi

echo "Installing Swiftlint."

if [ -d $CLONE_DIRECTORY ]; then
	echo "Removing existing Swiftlint clone."
	sudo rm -rf ${CLONE_DIRECTORY}
fi

echo "Cleaning Output Directory"
if [ -d $OUTPUT_DIRECTORY ]; then
	sudo rm -rf $OUTPUT_DIRECTORY
fi

echo "Cloning Swiftlint into ${CLONE_DIRECTORY}"
git clone ${SWIFTLINT_CLONE_URL} ${CLONE_DIRECTORY} > /dev/null

echo "Building Swiftlint."
(cd ${CLONE_DIRECTORY}; git checkout ${VERSION}; sudo make install > /dev/null;)

echo "Moving Swiftlint to ${OUTPUT_DIRECTORY}"
mkdir -p ${OUTPUT_DIRECTORY}
sudo cp /usr/local/bin/swiftlint ${OUTPUT_DIRECTORY} 
sudo cp -r /Library/Frameworks/SwiftlintFramework.framework ${OUTPUT_DIRECTORY}

sudo install_name_tool -rpath \
	"/Library/Frameworks" \
	"@executable_path" \
	"${OUTPUT_DIRECTORY}/swiftlint"

sudo install_name_tool -rpath \
	"/Library/Frameworks/SwiftLintFramework.framework/Versions/Current/Frameworks" \
	"@executable_path/SwiftLintFramework.framework/Versions/Current/Frameworks" \
	"${OUTPUT_DIRECTORY}/swiftlint"

echo "Swiftlint Installed Successfully."