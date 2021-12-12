getwd()

install.packages("pdftools")
install.packages("wordcloud")
install.packages("tm")
install.packages("RColorBrewer")
install.packages("stringr")

library(pdftools)
library(wordcloud)
library(tm)
library(RColorBrewer)
library(stringr)

sample <- pdf_text("git_guide.pdf")
str <- str_c(sample, collapse=" ")
no_space <- str_replace_all(str, "[[:space:]]{1,}", " ");

# 한글을 제외한 결과를 보고 싶다면 아래의 주석을 제거하고 
# 27줄의 'no_space'를 str_all로 변경하세요

# str_extract_all(no_space, "[^[:ascii:]]{1,}")
# str_all <- str_replace_all(no_space, "[^[:ascii:]]+", " ")

colorCode <- brewer.pal(8, "Paired")

wordcloud(
    words = no_space,
    min.freq = 5,
    max.words = 300,
    random.order = F,
    colors = colorCode,
    scale = c(10, 0.3)
)