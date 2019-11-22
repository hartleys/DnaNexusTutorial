#!/usr/bin/env python

import time, sys;

indata = sys.stdin;
outdata = sys.stdout;

for line in indata:
   time.sleep(2);
   words = line.split("[ \t]");
   for w in words:
      wordchars = [ c for c in w ];
      for c in wordchars:
         outdata.write(c);
         sys.stdout.flush();
         time.sleep(0.1);
      time.sleep(0.25);
     

