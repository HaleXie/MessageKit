#!/bin/sh

#  build_resource.sh
#  HLSDK
#
#  Created by Hale Xie on 2019/9/30.
#  Copyright © 2019 Hale Xie. All rights reserved.

if [ -z "${PROJECT_DIR}" ]; then
    PROJECT_DIR=$PWD
fi

MK_BUILD_SETTING="-derivedDataPath build"
MK_PPROJECT=${PROJECT_DIR}/MessageKit.xcodeproj
MK_CONFIGURATION=Release
MK_RESOURCES_TARGET_NAME="MessageKitResources"
MK_RESOURCES_BUILD_DIR=$(xcodebuild \
                        -project ${MK_PPROJECT} \
                        -scheme ${MK_RESOURCES_TARGET_NAME} \
                        -configuration ${MK_CONFIGURATION} \
                        ${MK_BUILD_SETTING} \
                        -sdk iphoneos \
                        -showBuildSettings \
                        | grep TARGET_BUILD_DIR \
                        | awk '{print $3}')

xcodebuild clean build -project ${MK_PPROJECT} \
-scheme ${MK_RESOURCES_TARGET_NAME} \
-configuration ${MK_CONFIGURATION} \
${MK_BUILD_SETTING} \
-sdk iphoneos \
ONLY_ACTIVE_ARCH=NO \
CODE_SIGNING_ALLOWED=NO \

MK_OUTPUT_DIR=${PROJECT_DIR}/distributive/
mkdir -p "${MK_OUTPUT_DIR}"
rm -rf "${MK_OUTPUT_DIR}/${MK_RESOURCES_TARGET_NAME}.bundle"
cp -RL "${MK_RESOURCES_BUILD_DIR}/${MK_RESOURCES_TARGET_NAME}.bundle" "${MK_OUTPUT_DIR}"

