#!/bin/bash

set -e

DEVICE=TECNO-KI5m
VENDOR=tecno

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then
    MY_DIR="${PWD}"
fi

ANDROID_ROOT="${MY_DIR}/../../.."
HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"

if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script: ${HELPER}"
    exit 1
fi

source "${HELPER}"

CLEAN_VENDOR=true
KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n|--no-cleanup)
            CLEAN_VENDOR=false
            ;;
        -k|--kang)
            KANG="--kang"
            ;;
        -s|--section)
            SECTION="${2}"
            shift
            ;;
        *)
            SRC="${1}"
            ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    :
}

setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
