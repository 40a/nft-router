#!/bin/bash
nft flush ruleset && nft -f /media/sysdata/app/gate/netfilter/sys/init.nft

