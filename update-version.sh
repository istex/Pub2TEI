#!/bin/bash

version=`node get-version.js`
sed -i 's/name="xslversion">[0-9]*.[0-9]*.[0-9]</name="xslversion">'$version'</' Stylesheets/Publishers.xsl

madate=$(date +'%Y-%m-%d')
sed -i 's/name="releasedate">[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}</name="releasedate">'$madate'</' Stylesheets/Publishers.xsl

if [ $? -ne 0 ]; then
    echo "error generating XSLT version number and release date."
    exit 1
else
    echo "XSLT version number and release date successfully updated."
    git commit -m "automatic update version to v$version in Publishers.xsl" package.json ./Stylesheets/Publishers.xsl
    if [ $? -ne 0 ]; then 
        echo "error commit Publishers.xsl"
        exit 1 
    fi
    git tag -a "v$version" -m "release version v$version"
    if [ $? -ne 0 ]; then
        echo "error creating tag $version"
        exit 1
    fi
    git push origin "v$version"
    if [ $? -ne 0 ]; then
        echo "error pushing tag v$version"
        exit 1
    fi
fi
