#!/bin/bash

logfile="/tmp/rabbitnode.log"

curhostname=`hostname`
echo "" > $logfile
echo "New Start Date:" >> $logfile
date >> $logfile
echo "" >> $logfile
echo "Running: rabbitmqctl add_vhost $curhostname" >> $logfile
/usr/sbin/rabbitmqctl add_vhost $curhostname >> $logfile

echo "Running: rabbitmqctl set_permissions -p $curhostname guest '.*' '.*' '.*'" >> $logfile
/usr/sbin/rabbitmqctl set_permissions -p $curhostname guest ".*" ".*" ".*"  >> $logfile
sleep 5
    
if [ -z "$CLUSTERED" ]; then

  echo "Starting non-Clustered Server Instance" >> $logfile
  # if not clustered then start it normally as if it is a single server
  /usr/sbin/rabbitmq-server  >> $logfile
  echo "Done Starting non-Clustered Server Instance" >> $logfile
    
  # Tail to keep the foreground process active.
  tail -f /var/log/rabbitmq/*

else
  if [ -z "$CLUSTER_WITH" ]; then
    # If clustered, but cluster is not specified then start normally as this could be the first server in the cluster
    echo "Starting Single Server Instance" >> $logfile
    /usr/sbin/rabbitmq-server >> $logfile
  
    echo "Done Starting Single Server Instance" >> $logfile
  else
    echo "Starting Clustered Server Instance as a DETACHED single instance" >> $logfile
    /usr/sbin/rabbitmq-server -detached >> $logfile

    echo "Stopping App with /usr/sbin/rabbitmqctl stop_app" >> $logfile
    /usr/sbin/rabbitmqctl stop_app >> $logfile

    # This should attempt to join a cluster master node from the yaml file
    if [ -z "$RAM_NODE" ]; then
      echo "Attempting to join as DISC node: /usr/sbin/rabbitmqctl join_cluster rabbit@$CLUSTER_WITH" >> $logfile
      /usr/sbin/rabbitmqctl join_cluster rabbit@$CLUSTER_WITH >> $logfile
    else
      echo "Attempting to join as RAM node: /usr/sbin/rabbitmqctl join_cluster --ram rabbit@$CLUSTER_WITH" >> $logfile
      /usr/sbin/rabbitmqctl join_cluster --ram rabbit@$CLUSTER_WITH >> $logfile
    fi
    echo "Starting App" >> $logfile
    /usr/sbin/rabbitmqctl start_app >> $logfile

    echo "Done Starting Cluster Node" >> $logfile
  fi
    
  # Tail to keep the foreground process active.
  tail -f /var/log/rabbitmq/*

fi
