#!/bin/bash

THEMES="$1/common/components/feed/themes"

echo The line count for each of the theme components
echo "CardsTheme:    $(cat $THEMES/card-flow/card-flow.js | wc -l) lines"
echo "CarouselTheme: $(cat $THEMES/carousel/carousel.js | wc -l) lines"
echo "GridTheme:     $(cat $THEMES/tile-grid/tile-grid.js | wc -l) lines"
echo "SingleTheme:   $(cat $THEMES/single/single.js | wc -l) lines"
echo

echo CardsTheme render methods:
cat $THEMES/card-flow/card-flow.js | grep -o " render[A-Za-z][A-Za-z]*[(]" | tr -d ' (' | sort
echo

echo CarouselTheme render methods:
cat $THEMES/carousel/carousel.js | grep -o " render[A-Za-z][A-Za-z]*[(]" | tr -d ' (' | sort
echo

echo GridTheme render methods:
cat $THEMES/tile-grid/tile-grid.js | grep -o " render[A-Za-z][A-Za-z]*[(]" | tr -d ' (' | sort
echo

echo SingleTheme render methods:
cat $THEMES/single/single.js | grep -o " render[A-Za-z][A-Za-z]*[(]" | tr -d ' (' | sort
echo

echo Source file sizes
find $1 -type f -name "*.js" -not -name "*.test.js" -exec wc -l {} + | sort --numeric-sort --reverse
echo

echo Number of lines containing getSetting
grep -r --include '*.js' getSetting $1 2> /dev/null | wc -l
echo

function allClassMethods() {
    cat $THEMES/card-flow/card-flow.js | grep -o "^  [A-Za-z][A-Za-z]*[(]" | tr -d ' ('
    cat $THEMES/carousel/carousel.js | grep -o "^  [A-Za-z][A-Za-z]*[(]" | tr -d ' ('
    cat $THEMES/single/single.js | grep -o "^  [A-Za-z][A-Za-z]*[(]" | tr -d ' ('
    cat $THEMES/tile-grid/tile-grid.js | grep -o "^  [A-Za-z][A-Za-z]*[(]" | tr -d ' ('
}

echo The following methods are duplicated
echo They occur in at least two different Theme components
allClassMethods | sort | uniq -d
echo

echo The following render methods are duplicated
echo They occur in at least two different Theme components
allClassMethods | sort | uniq -d | grep 'render[A-Za-z][A-Za-z]*'
echo
