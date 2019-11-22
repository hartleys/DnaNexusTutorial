#!/usr/bin/env Rscript 

#args <- commandArgs(trailingOnly=TRUE)

library("bookdown");


#bookdown::render_book(args[1], "bookdown::gitbook")
#bookdown::render_book(args[1], "bookdown::pdf_book")

bookdown::render_book("dnaNexusTutorial.SWH.2019.09.Rmd", "bookdown::gitbook")
bookdown::render_book("dnaNexusTutorial.SWH.2019.09.Rmd", "bookdown::pdf_book")



