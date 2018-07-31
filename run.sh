#!/bin/sh

set -e

jmeter -n -t tests/PerfectAdviceUAT.jmx -l tests/results.jtl