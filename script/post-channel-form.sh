#!/usr/bin/env bash

uri=http://localhost:9292/k2w2-0v0a 

curl -X POST \
  -F 'first_name=johnny' \
  -F 'last_name=lawrence' \
  $uri

