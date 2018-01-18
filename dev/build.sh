#!/usr/bin/env bash

dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

cd ${dir}/.. && docker build -t newtoncodes/youtrack .
cd ${dir}/.. && docker build -t newtoncodes/youtrack:5.7 .
