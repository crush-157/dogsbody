#!/bin/bash

# download dependencies
bundle install

if [[ -n $PORT ]]; then
  SET_PORT="-p $PORT"
fi

rake db:migrate

# run in context of bundle
bundle exec ruby app.rb $SET_PORT -e production
