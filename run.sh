#!/bin/sh

set -e

jmeter -n -t $(pwd)/test/PerfectAdviceUAT.jmx -l $(pwd)test/testresults.jtl