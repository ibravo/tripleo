for nodes in $(ironic node-list | tail -n +4 | head -n -1 | awk -F "| " '{print $2}');
  do ironic node-show $nodes;
done
