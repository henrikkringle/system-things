#!/bin/bash
#!/bin/bash
TESTFILE='http://speedtest.tele2.net/100MB.zip'
LOGFILE='ispeed.log'
UPLOADFILE='100MB.zip'

#wget data-output send to /dev/null.
#terminal-output from wget is stderr so it redirected to stdout with 2>&1
#tail gets last to lines. head fetches first line (second lines i empty). cut fetches timestamp and speed from output
#tr -d '(' removes extra (
wget -O /dev/null $TESTFILE 2>&1 | tail -n 2 | head -n 1 | cut -d')' -f1 | tr -d '(' >> $LOGFILE

#ping test - outputs average ms
PING=`ping -c 10 8.8.8.8 | tail -n 1 | cut -d'=' -f2 | cut -d'/' -f2`"ms"
echo $PING >> $LOGFILE

#Upload - maybe works -weird characther issues
curl -T $UPLOADFILE ftp://speedtest.tele2.net/upload/ 2>&1 | tr '^M' '\n' | tail -n 1 | awk '{ print $2 }' >> $LOGFILE
echo "---------" >> $LOGFILE
