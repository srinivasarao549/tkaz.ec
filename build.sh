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

sed -i '' -e "s/##GA##/$GA/" index.html

yuicompressor -o css.css css.css

python - <<EOF
import re, subprocess

def js(m):
	proc = subprocess.Popen(["closure", "--language_in", "ECMASCRIPT5"], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
	return "<script>" + proc.communicate(m.group(1))[0] + "</script>"

file = re.sub("<script>((?:.|\n)+)</script>", js, open("index.html").read())
open("index.html", "w").write(file)
EOF