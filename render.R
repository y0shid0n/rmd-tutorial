library(rmarkdown)
library(purrr)

df_params = read.csv("./params.csv")

for (i in 1:nrow(df_params)) {
  row <- df_params[i,]
  arg01 <- row[["hoge"]]
  arg02 <- row[["fuga"]]
  arg03 <- row[["piyo"]]

  render("./sample.Rmd"
         , output_format = "html_document"
         , output_file = paste0("./sample_", arg01, ".html")
         , params = list(arg01=arg01, arg02=arg02, arg03=arg03)
         )
}

# パラメータのリストから各要素を抜き出してrenderに渡す
myfunc <- function(l) {
  arg01 <- l[["hoge"]]
  arg02 <- l[["fuga"]]
  arg03 <- l[["piyo"]]

  render("./sample.Rmd"
         , output_format = "html_document"
         , output_file = paste0("./sample_", arg01, ".html")
         , params = list(arg01=arg01, arg02=arg02, arg03=arg03)
  )
}

# transpose(data.frame)はlist of rowsを返す
map(transpose(df_params), myfunc)
