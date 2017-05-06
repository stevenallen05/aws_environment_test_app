#!/bin/bash

if [ "$ROLE" == "WEB" ]
then
  bundle exec rails s -b 0.0.0.0;
fi
if [ "$ROLE" == "WORKER" ]
then
  bundle exec sidekiq;
fi
