#!/usr/bin/env bash

uri=http://localhost:9292/k2w2-0v0a
header='Content-Type: application/json'
data="{\"first_name\":\"johnny\",\"last_name\":\"lawrence\"}"

curl -X POST -d "data=$data" $uri

