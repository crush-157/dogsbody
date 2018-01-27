FROM ruby
RUN apt-get update
ADD . /app/
WORKDIR /app
RUN bundle install
CMD ["bundle","exec","ruby","app.rb","-e production"]
