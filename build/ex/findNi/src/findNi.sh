#!/bin/bash
# helloWorldTestApp 0.0.2

main() {

    #First, let's print out the input file, to make sure the inputs 
    # got set properly:
    echo "Value of wordsFile: '$wordsFile'"
    echo "Value of wordsFile_name: $wordsFile_name"
    
    #Next let's download the words file from the cloud and into
    # our virtual machine.
    dx download "$wordsFile" -o $wordsFile_name

    #This part is the program itself. It takes the input and grabs 
    # all the words that begin with Ni
    cat $wordsFile_name | grep "^ni" > words.that.begin.with.ni.txt

    #This part uploads the resultant file to the cloud
    # If you don't do this, then all the files you made will be 
    # deleted when the virtual machine gets shut down.
    #Note: dx upload --brief returns a file code that 
    # the next tool needs in order to register the output.
    outfile_dx_code=$(dx upload words.that.begin.with.ni.txt --brief)

    #Finally: this part registers the output and connects it to this job
    # That way the output will be accessable from the job screen.
    dx-jobutil-add-output outfile "$outfile_dx_code" --class=file


}
