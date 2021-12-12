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

# If you want to see the results excluding Hangul, remove the comment below and
# Replace 'no_space' on line 27 with str_all

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