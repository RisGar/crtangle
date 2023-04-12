#!/bin/sh

mkdir ./build
crystal build src/crtangle.cr --no-debug --release -o ./build/crtangle