#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
#
# this runs a series of unit tests for devstack to ensure it's functioning

if [[ -n $@ ]]; then
    FILES=$@
else
    LIBS=`find lib -type f | grep -v \.md`
    SCRIPTS=`find . -type f -name \*\.sh`
    EXTRA="functions functions-common stackrc openrc exerciserc eucarc"
    FILES="$SCRIPTS $LIBS $EXTRA"
fi

echo "Running bash8..."

./tools/bash8.py -v $FILES


# Test that no one is trying to land crazy refs as branches

echo "Ensuring we don't have crazy refs"

REFS=`grep BRANCH stackrc | grep -v -- '-master'`
rc=$?
if [[ $rc -eq 0 ]]; then
    echo "Branch defaults must be master. Found:"
    echo $REFS
    exit 1
fi
