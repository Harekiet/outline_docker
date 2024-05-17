FROM php:7.3-fpm
#Prepare apt packages
RUN apt update && apt install -y zlib1g-dev libpng-dev tzdata cron 
#Install php extras
RUN docker-php-ext-install gd
RUN docker-php-ext-enable gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

#Clear apt stuff
RUN rm -rf /var/cache/apk/*
RUN rm -rf /var/lib/apt/lists/*

