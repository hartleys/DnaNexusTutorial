

rm _main.Rmd
rm -rf _book

buildScripts/build.bash dnaNexusTutorial.SWH.2019.09.Rmd

cp -R _book/* ../docs/

ln -s ../docs/prepreintro.html  ../docs/index.html
ln -s ./_book/prepreintro.html  ./_book/index.html
ln -s ./_book/index.html        ./_book/00index.html


#mv ../docs/_main.pdf ../docs/DnaNexusTutorial.pdf

#cat scrap/codeblockwiz.txt | sed 's/[^A-Za-z0-9_.+-<>\[\]()\/:]/ /g' > scrap/codeblockwiz.clean.txt 

