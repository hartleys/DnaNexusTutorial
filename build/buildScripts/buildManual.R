#!/usr/bin/env Rscript 

#args <- commandArgs(trailingOnly=TRUE)

library("bookdown");


#bookdown::render_book(args[1], bookdown::gitbook(split_by="section+number"))
#bookdown::render_book(args[1], "bookdown::pdf_book")

#bookdown::render_book("dnaNexusTutorial.SWH.2019.09.Rmd", bookdown::gitbook(split_by="section+number"))


unlink("_book",force=TRUE);
unlink("_main.Rmd")
bookdown::render_book("dnaNexusTutorial.SWH.2019.09.Rmd", 
    bookdown::gitbook(split_by="section+number",
                     css="custom.css",
                     includes = list( after_body = "resizeScript.html" ),
                     config=list(fontsettings = list(size = 3) )
                     )
   )




#bookdown::render_book("dnaNexusTutorial.SWH.2019.09.Rmd", "bookdown::pdf_book")
#<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
#<script src="resizeToFit.js"></script>
