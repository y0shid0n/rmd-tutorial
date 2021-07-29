library(rmarkdown)

render("./sample.Rmd"
       , output_format = "html_document"
       , output_file = "./sample.html"
       , params = list(arg01="hoge", arg02=999, arg03="fuga")
       )
