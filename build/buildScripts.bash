

rm _main.Rmd

buildScripts/build.bash dnaNexusTutorial.SWH.2019.09.Rmd

cp -R _book/* ../docs/

#cat scrap/codeblockwiz.txt | sed 's/[^A-Za-z0-9_.+-<>\[\]()\/:]/ /g' > scrap/codeblockwiz.clean.txt 

