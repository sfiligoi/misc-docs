#!/bin/bash

for r in eu-west-1 us-east-1 us-east-2; do
  echo "/opt/aws_cmds/aws_template_request.sh $r p3 $1"
  /opt/aws_cmds/aws_template_request.sh $r p3 "$1"
done

