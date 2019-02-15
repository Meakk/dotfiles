#!/bin/bash

if [ $UID != 0 ] ; then
    echo "Must be root!"
    exit 1
fi

patch_dir=$HOME/.cache/wal
if [ ! "$1" = "" ] ; then
    patch_dir=$1
fi

vivaldi_path=$(dirname $(find /opt -name "vivaldi-bin"))

if [ "$vivaldi_path" = "" ] ; then
    echo "Cannot find vivaldi path"
    exit 2
fi

# backup browser.html
cp "$vivaldi_path/resources/vivaldi/browser.html" "$vivaldi_path/resources/vivaldi/browser.html-$(date +%Y-%m-%dT%H-%M-%S)"

# add custom.css
if [ -f "$patch_dir/vivaldi.css" ] ; then
    # copy css
    cp -f "$patch_dir/vivaldi.css" "$vivaldi_path/resources/vivaldi/style/custom.css"

    # patch browser.html
    css_patched=$(grep '<link rel="stylesheet" href="style/custom.css" />' $vivaldi_path/resources/vivaldi/browser.html)
    if [ "$css_patched" = "" ] ; then
        sed -i -e 's/<\/head>/<link rel="stylesheet" href="style\/custom.css" \/> <\/head>/' "$vivaldi_path/resources/vivaldi/browser.html"
    fi
fi

# add custom.js
if [ -f "$patch_dir/vivaldi.js" ] ; then
    # copy js
    echo cp -f "$patch_dir/vivaldi.js" "$vivaldi_path/resources/vivaldi/style/custom.js"
    cp -f "$patch_dir/vivaldi.js" "$vivaldi_path/resources/vivaldi/style/custom.js"

    # patch browser.html
    js_patched=$(grep '<script src="custom.js"><\/script>' $vivaldi_path/resources/vivaldi/browser.html)
    if [ "$js_patched" = "" ] ; then
        sed -i -e 's/<\/body>/<script src="custom.js"><\/script> <\/body>/' "$vivaldi_path/resources/vivaldi/browser.html"
    fi
fi
