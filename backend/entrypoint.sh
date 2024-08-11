#!/bin/bash

set -e

bundle exec rake db:migrate

exec bundle exec rails server -b 0.0.0.0