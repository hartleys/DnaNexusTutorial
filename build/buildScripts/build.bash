echo "loading modules... $(date)"
module load libffi
module load libz/1.2.11
module load libgmp
module load ghc/v8.4.2
module load haskell/2013.2.0.0
module load cabal/v2.4.1.0
module load texinfo/6.3
module load texlive/2013
module unload R
module load R/3.5.2
module unload vArmyKnifeBeta
module unload vArmyKnife
module load vArmyKnifeBeta/2.2.222
module load dx

rm _main.Rmd

dx select project-FbvPXyQ0pgP1PQbkJG1vfQpz

echo "modules loaded. $(date)"

echo "building... $(date)"

Rscript buildScripts/buildManual.R $1

echo "done... $(date)"

#cp buildScripts/styles.* _book/
#
#while read HTMLFILE
#do
#  sed -i 's/<style/<link rel="stylesheet" type="text\/css" href="styles.css" \/><style/g' $HTMLFILE
#  sed -i 's/<\/body>/<script type="text\/javascript" src="styles.js"><\/script><\/body>/g' $HTMLFILE
#
#done < <( ls _book/*.html ) 
