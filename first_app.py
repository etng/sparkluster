#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import findspark
findspark.init()
import pyspark
sc = pyspark.SparkContext(master=os.environ.get('SPARK_MASTER_URL'), appName='sparkluster-demo')
for k, v in sc.getConf().getAll():
    print k, v
