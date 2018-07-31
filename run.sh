#!/bin/sh

set -e

jmeter -n -t tests/test_plan.jmx -l tests/results.jtl