for nodes in $(ironic node-list | grep -v "UUID" | awk '{print $2}');
 do ironic node-set-provision-state $nodes manage;
 openstack baremetal introspection start $nodes;
 sleep 300 ;
 done

sleep 300

for nodes in $(ironic node-list | grep -v "UUID" | awk '{print $2}');
 do ironic node-set-provision-state $nodes provide;
 done

