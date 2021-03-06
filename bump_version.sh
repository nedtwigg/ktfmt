#!/bin/sh
# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Edit the file before running it."
exit # <--- comment out after updating the versions below.

CURRENT_VERSION="0.13"
NEXT_VERSION="0.14"

POM1="$HOME/fbsource/xplat/ktfmt/pom.xml"
POM2="$HOME/fbsource/xplat/ktfmt/core/pom.xml"

sed -i.bak "s/$CURRENT_VERSION-SNAPSHOT/$CURRENT_VERSION/g" "$POM1" "$POM2"
hg commit -m "[ktfmt] Bump version to $CURRENT_VERSION" "$POM1" "$POM2"
sed -i.bak "s/$CURRENT_VERSION/$NEXT_VERSION-SNAPSHOT/g" "$POM1" "$POM2"
hg commit -m "[ktfmt] Bump version to $NEXT_VERSION-SNAPSHOT" "$POM1" "$POM2"
