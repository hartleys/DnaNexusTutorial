#!/bin/bash
# helloWorldTestApp 0.0.3

main() {

    outfile_dx_code=$(dx download "$wordsFile" -o - | \
              grep "^ni" | \
              dx upload - --brief --path words.that.begin.with.ni.v3.txt)

    dx-jobutil-add-output outfile "$outfile_dx_code" --class=file

}
