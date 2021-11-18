# My R docker
FROM jcvz/r-libs:firsttry

# Begin R app
RUN mkdir /home/app/
COPY ./ /home/app/
WORKDIR /home/app/build/
RUN chmod -R 777 *
RUN chmod +rwx note_fixer.sh
CMD Rscript -e "library('servr'); httd('..', host='0.0.0.0'); Sys.sleep(Inf)" & Rscript app.R