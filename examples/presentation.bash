
#---------------------------------------------------------
# First you have to login.
# Note, you'll only have to do this the first time you run dx
dx login

#---------------------------------------------------------
# Look at your projects:
dx find projects

#---------------------------------------------------------
# Select the project you want using dx select:
dx select project-FbvPXyQ0pgP1PQbkJG1vfQpz

#---------------------------------------------------------
# dx has many of the base unix commands:
dx ls
dx cd test
dx cd ..

#---------------------------------------------------------
# You can upload data to DNAnexus using the dx upload command:
# in this case I'm uploading a simple list of english words.
dx upload indata/linux.words.txt --brief --path /test/linux.words.txt


#---------------------------------------------------------
# You can create a new app using the dx-app-wizard 
# This just generates the minimal app files.

dx-app-wizard

cat wizardInputs.txt | ./typeInput.py | dx-app-wizard

expect indata/wizardSends.txt

indata/wizardSends

findNi
Find Ni
Finds words that begin with Ni



appVersion="v2"
appVersion="v3"

cp dxapp.${appVersion}.json findNi/dxapp.json
cp helloWorldTestApp.${appVersion}.bash findNi/src/findNi.sh

dx build -f helloWorldTestApp

dx run helloWorldTestApp -i infile=/test/linux.words.txt --destination /test/

dx find jobs

dx terminate 

dx terminate job-Ff6V8Gj0pgP24xj1Bv8jJjXg

dx download /test/words.that.begin.with.ni.txt

less words.that.begin.with.ni.txt



#CLEANUP FOR PRESENTATION
#Delete all files so that we can start fresh in the presentation!

dx rm test/words.that.begin.with.ni.txt
dx rm test/linux.words.txt
dx rm helloWorldTestApp







