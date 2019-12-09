

rm _main.Rmd
rm -rf _book

buildScripts/build.bash dnaNexusTutorial.SWH.2019.09.Rmd

cp -R _book/* ../docs/

cd ../docs/
rm index.html
cp "1-MAINTITLE.html"  "index.html"
cd ../build/
ln -s ./_book/1-MAINTITLE.html  ./_book/index.html
ln -s ./_book/1-MAINTITLE.html  ./_book/00index.html


#mv ../docs/_main.pdf ../docs/DnaNexusTutorial.pdf

#cat scrap/codeblockwiz.txt | sed 's/[^A-Za-z0-9_.+-<>\[\]()\/:]/ /g' > scrap/codeblockwiz.clean.txt 

