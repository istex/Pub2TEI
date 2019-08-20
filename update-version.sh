#!/bin/bash

version=`node get-version.js`
sed -i 's/name="xslversion" value="[0-9]*.[0-9]*.[0-9]"/name="xslversion" value="'${version}'"/' Stylesheets/Publishers.xsl

echo "XSLT version number successfully updated. Check Publishers.xsl file and don't forget to commit/push to git repository."