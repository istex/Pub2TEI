#!/bin/bash

version=`node get-version.js`
sed -i 's/name="xslversion">[0-9]*.[0-9]*.[0-9]</name="xslversion">'$version'</' Stylesheets/Publishers.xsl

madate=$(date +'%d-%m-%Y')
sed -i 's/name="releasedate">[0-9]\{2\}-[0-9]\{2\}-[0-9]\{4\}</name="releasedate">'$madate'</' Stylesheets/Publishers.xsl

echo "XSLT version number and release date successfully updated. Check Publishers.xsl file and don't forget to commit/push to git repository."