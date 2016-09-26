#!/bin/bash
nft flush ruleset && nft -f ./sys/init.nft

