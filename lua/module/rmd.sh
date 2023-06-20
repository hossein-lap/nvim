#!/bin/sh

tmp="/tmp/test.rmd"

Rscript -e "source('/home/hos/.config/pandoc/config.r'); rmarkdown::render(input = '${tmp}', output_format = 'pdf_document', params = list(pandoc_options = c(args = '--defaults', '/home/hos/.config/pandoc/defaults/dracula/dracula.yaml')))"
