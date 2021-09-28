#!/bin/bash

JAVA_SCAN_ROOT=/Library/Java/JavaVirtualMachines/
if [[ -z ${JAVA_HOME}  ]]; then
	DEFAULT_ROOT=${JAVA_SCAN_ROOT}$(ls -1 "${JAVA_SCAN_ROOT}" |head -n 1)
	export JAVA_HOME=${DEFAULT_ROOT}/Contents/Home
fi
