#!/bin/sh
#
# (C) Copyright 2016-2018 Diomidis Spinellis
#
# This file is part of git-issue, the Git-based issue management system.
#
# git-issue is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# git-issue is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with git-issue.  If not, see <http://www.gnu.org/licenses/>.
#

SCRIPT_NAME=git-issue.sh

# Update usage information in the script based on README.md
{
  sed -n '1,/^The following commands are available/p' $SCRIPT_NAME
  sed -n '/^\* `git issue init`/,/^\* `git issue git`/ {
    /^\* /!d
    s/`//g
    s/^\* //
    p
  }' README.md
  sed -n '/^USAGE_EOF/,$p' $SCRIPT_NAME
} >newgi.sh
mv newgi.sh $SCRIPT_NAME
chmod +x git-issue.sh
