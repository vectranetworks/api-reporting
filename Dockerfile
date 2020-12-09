# My R docker
FROM jcvz/r-libs:firsttry

# Begin R app
RUN mkdir /home/app/
COPY ./ /home/app/
WORKDIR /home/app/build/
RUN chmod -R 777 *
CMD Rscript -e "library('servr'); httw('..', host='0.0.0.0'); Sys.sleep(Inf)" & Rscript app.R