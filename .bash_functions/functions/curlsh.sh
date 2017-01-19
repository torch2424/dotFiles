#!/bin/bash

# Script to curl a file into sh
curlsh() {
	bash <(curl -s $1)
}
