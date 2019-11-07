#! /bin/sh

# See https://unity3d.com/get-unity/download/archive
# to get download URLs
# UNITY_DOWNLOAD_CACHE="$(pwd)/unity_download_cache"
# UNITY_OSX_PACKAGE_URL="https://download.unity3d.com/download_unity/20c1667945cf/MacEditorInstaller/Unity-2019.2.0f1.pkg"
# UNITY_WINDOWS_TARGET_PACKAGE_URL="https://beta.unity3d.com/download/20c1667945cf/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-2019.2.0f1.pkg"

BASE_URL=https://netstorage.unity3d.com/unity
HASH=20c1667945cf
VERSION=2019.2.0f1

# function to get file

getFileName() {
    echo "${UNITY_DOWNLOAD_CACHE}/`basename "$1"`"
}

# Downloads a file if it does not exist
download() {

	file=$1
    	url="$BASE_URL/$HASH/$file"
    	filePath=$(getFileName $file)
    	fileName=`basename "$file"`
	
	# Downloads a package if it does not already exist in cache
	#if [ ! -e $UNITY_DOWNLOAD_CACHE/`basename "$URL"` ] ; then
	#	echo "$FILE does not exist. Downloading from $URL: "
	#	mkdir -p "$UNITY_DOWNLOAD_CACHE"
	#	curl -o $UNITY_DOWNLOAD_CACHE/`basename "$URL"` "$URL"
	#else
	#	echo "$FILE Exists. Skipping download."
	#fi
	
	
    if [ ! -e $filePath ] ; then
        echo "Downloading $filePath from $url: "
        curl --retry 5 -o "$filePath" "$url"
    else
        echo "$fileName exists in cache. Skipping download."
    fi
}

# Downloads and installs a package from an internet URL
install() {
	# PACKAGE_URL=$1
	# download $1

	# echo "Installing `basename "$PACKAGE_URL"`"
	# sudo installer -dumplog -package $UNITY_DOWNLOAD_CACHE/`basename "$PACKAGE_URL"` -target /
	
	package=$1
    	filePath=$(getFileName $package)

   	download "$package"

    	echo "Installing $filePath"
    	sudo installer -dumplog -package "$filePath" -target /

}

install "MacEditorInstaller/Unity-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-$VERSION.pkg"

#echo "Contents of Unity Download Cache:"
#ls $UNITY_DOWNLOAD_CACHE

#echo "Installing Unity..."
#install $UNITY_OSX_PACKAGE_URL
#install $UNITY_WINDOWS_TARGET_PACKAGE_URL
