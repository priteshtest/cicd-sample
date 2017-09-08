#!/usr/bin/bash
set -x
adb_bin="adb"
	
function setup() {
	
	# try a clean server kill
	$adb_bin kill-server
	# then try a hard server kill since the former doesn't always work...
	ps aux  |  grep -i adb |  grep -v grep   | awk '{print $2}' | xargs kill -9 || true
	# restart the server
	$adb_bin start-server
	sleep 10
	$adb_bin devices

}	

function run() {
	echo "test is running...."
}

function main() {
	echo "Setup Test Environment"
	setup
	echo "Run UI test"
	run
}
main
