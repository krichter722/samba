#!/bin/sh

. "${TEST_SCRIPTS_DIR}/unit.sh"

define_test "all, 3 nodes, all OK"

required_result 0 <<EOF
Number of nodes:3
pnn:0 192.168.20.41    OK
pnn:1 192.168.20.42    OK
pnn:2 192.168.20.43    OK (THIS NODE)
EOF

simple_test all <<EOF
NODEMAP
0       192.168.20.41   0x0
1       192.168.20.42   0x0
2       192.168.20.43   0x0     CURRENT RECMASTER

IFACES
:Name:LinkStatus:References:
:eth2:1:2:
:eth1:1:4:

VNNMAP
654321
0
1
2
EOF
