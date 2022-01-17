#! /usr/bin/env bash

# Uninstall pip package and all of of their dependencies

# Check that the given package exists/is installed
package=$(pip list --no-color | awk '{print $1}' | grep -x -i "$1")
[[ -z $package ]] && printf "Package %s could not be found. \nAre you sure you've typed it correctly?" "$1" && exit

# Get dependencies of a given package
# $1: package name
# $2: "Requires"    -> get package dependencies
#     "Required-by" -> get any other installed packages that have this package as a dependency
get_deps() {
    echo $(pip show "$1" | grep "$2" | sed "s/$2: //g; s/,//g")
}

# Uninstall main package first so that it
# doesn't appear in the "Required-by" list for the packages in $deps
echo "Uninstalling $package..."
deps=$(get_deps "$package" "Requires")
pip uninstall --quiet -y $package

for dep in $deps; do
    # Check if the given $dep is required by any other installed packages
    # Skip $dep if true
    [[ -n "$(get_deps $dep "Required-by")" ]] && continue
    echo "Uninstalling $dep..."
    pip uninstall --quiet -y $dep
done

echo " Done"
