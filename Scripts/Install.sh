#! /bin/sh

# See https://unity3d.com/get-unity/download/archive
# to get download URLs
# UNITY_DOWNLOAD_CACHE="$(pwd)/unity_download_cache"
# UNITY_OSX_PACKAGE_URL="https://download.unity3d.com/download_unity/20c1667945cf/MacEditorInstaller/Unity-2019.2.0f1.pkg"
# UNITY_WINDOWS_TARGET_PACKAGE_URL="https://beta.unity3d.com/download/20c1667945cf/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-2019.2.0f1.pkg"

# Example install script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# This link changes from time to time. I haven't found a reliable hosted installer package for doing regular
# installs like this. You will probably need to grab a current link from: http://unity3d.com/get-unity/download/archive
echo 'Downloading from https://download.unity3d.com/download_unity/20c1667945cf/MacEditorInstaller/Unity-2019.2.0f1.pkg: '
curl -o Unity.pkg https://download.unity3d.com/download_unity/20c1667945cf/MacEditorInstaller/Unity-2019.2.0f1.pkg

echo 'Installing Unity.pkg'
sudo installer -dumplog -package Unity.pkg -target /
