#!/bin/bash
# $ bash build.sh containerdir googleanalyticsacc

SRCDIR="$( cd "$( dirname "$0" )" && pwd )"
OUTDIR="$1/tkazec"
GA=$2

rm -rf $OUTDIR
cp -R $SRCDIR $OUTDIR
cd $OUTDIR

rm build.sh
rm -rf .git

sed -i '' -e "s/##GA##/$GA/" index.js

echo "<style>`yuicompressor index.css`</style>" > index.css
echo "<script>`closure --language_in ECMASCRIPT5 --js index.js`</script>" > index.js
sed -i '' -e '/href="index.css"/d' -e '/<link/r index.css' index.html
sed -i '' -e '/<script/d' -e '/<\/style>/r index.js' index.html
rm index.css
rm index.js