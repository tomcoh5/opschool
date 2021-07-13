#!/bin/bash
#add fix to exercise6-fix here
#!/usr/bin/env bash
args="$@"
path_to_send_files=$(echo ${args##* })
path_to_local_files=$(echo "${args}" | rev | cut -d ' ' -f '2-' | rev)

current_server=$(hostname)
if [ "$current_server" == "server1" ];then
  target_server="server2"
elif [ "$current_server" == "server2" ];then
  target_server="server1"
fi

# /tmp/file1 /tmp/file2 /tmp/file3 /home/ubuntu
if ssh $target_server "true";then
        echo ""
else
  echo "Error cmd failed: ssh  $target_server"
  exit 1
fi
total=0
for path in $path_to_local_files;do
  rsync -avz $path ${target_server}:${path_to_send_files} >> /dev/null
  rsync_status=$?
  current_size=$(rsync -avz $path ${target_server}:${path_to_send_files} | grep "total size is" | awk '{print $4}')
  if [ "$rsync_status" -ne 0 ];then
    echo "rsync -avz $path_to_local_files  ${target_server}:${path_to_send_files}"
    exit 1
  fi
  total=$(( $total + $current_size ))
done
echo "$total"

