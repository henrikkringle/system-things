exit
#HOW THIS FILE WORKS:
###topic
##command
#description



###math
##expr integermath
#add 
expr 5 + 5 #10 (remember space between operator and values)
#substract and add to variable
somevar=$(expr 10 - 5) #5
##
##bc floatingpoint
#divide
echo "scale=2;3 / 5" | bc #0.60 - scale sets number of digits
##
###text processing

##grep
#search text files for patterns
#ways of getting input
#pipe
cat /var/log/syslog | grep wlan0
#from file
grep wlan0 /var/log/syslog
#with line number 
grep -n wlan0 /var/log/syslog
#case insensitive
grep -i WLAN0 /var/log/syslog
#regex - show caseinsensitive wlan[0-3]
grep "^wlan|WLAN[0-3]" /var/log/syslog
##

##cut
##
 



##awk
#print all fields in file. nice for finding the right column
awk '{print NR": "$0; for(i=1;i<=NF;++i)print "\t"i": "$i}' FILENAME
##


##sed
#replace words or characters ( -E is extended regex)
sed -E "s/Shit/Poopoo/" filename > newfilename
#replace words or characters in file - in place - be careful :)
sed -i "s/kantine\@skole\.com/kantine\@gmail\.com/" mails.txt
#replace foo with bar, on lines with bam
sed "/bam/ s/foo/bar/" filename > newfilename
##

##tail
#follow logfile (very useful!)
tail -f /var/log/syslog
##

##vim
#moving around in vim
#first character on next line
<ENTER>
#or +
#first character in previous line
-


#remove all ^M (ASCII-characters CR and LF) from text file
#^M is made by holding <CTRL> and pressing V and then M
#and vim commandn: 
:%s///g

#goto line
29G

#copy to clipboard (osx)
#with selected text (Visual)
:w !pbcopy
##

###files
##find
#send permission denied to null
find / -name filename 2> /dev/null
##

##ls
#sort files by date of modification ??!
ls -t
##

##mkdir
#make "recursive" directories - phew.
mkdir -p a/long/directory/path
##

##rsync
#check transfer speed while copying file
rsync --progress <sourcefile> <destfile>
##
#more esoteric alternative with pv
##pv
pv -pra <source> > <dest> # -p is process, -r is rate and -a is average rate
##
###

###processes
##kill
#stop specific process
kill -STOP 5149 
#let process continue again
kill -CONT 5149
##
##strace
strace <program>
##
###


###system

###

###networking
##wget
#download a range of file with specific filename - add -w to seq to add zeroes matching largest numberwidth
for i in $(seq $STARTNUM $ENDNUM); do wget http://baseurl.xx/bla/book"$i".pdf; done
##

##iptables
#list rules
iptables -S
#only one chain
iptables -S INPUT
#list rule-numbers (can be used to change and remove specific rules)
iptables -S --line-numbers
##

##nc
#receive log persistently
#receiver:
while true; do nc -l 4444 >> remotelog.txt; sleep 2; done
#transmitter
echo "Message" | nc host.local 4444
##

##tshark
#discover hosts on local network
tshark -ni en1 -Y "bootp.option.type == 53" -T fields -e bootp.option.hostname -e eth.src_resolved
##

##ssh
#reverse shell
#setup reverse shell through public server port 9999
#from local server
ssh -R 9999:localhost:22 remotelogin@publicserverip
#to login from different machine
ssh remotelogin@publicserverip
ssh localuser@localhost -p 9999
#tadaaa
##


##cutycapt
#capture webpage to png
xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=... --out=... --user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A'
##

##curl
#get public ip
curl ifconfig.me
#or this
curl ipinfo.io/ip
##

##iw tool
#set wireless interface to monitor-mode
sudo iw wlan0 set type monitor
#using aircrack-ng suite
airmon-ng start wlan0
##
###



###lolz
##nyancat
#onscreen nyancat
nc nyancat.dakko.us 23
##
#ascii star wars
nc towel.blinkenlights.nl 23
##
##fortune
#fun quotes
fortune
#fun quotes being read aloud
say $(fortune)
##
##cowsay
#ascii cow says things
echo "Muuuh" | cowsay
##
###


###terminal shortcuts
##terminal
#go to beginning of line
<ctrl>+a
#go to end of line
<ctrl>+e
#go left one word
<alt>+b
#go right one word
<alt>+f
#some weird magic that might be useful
<ctrl>+xx
#delete character under cursor
<ctrl>+d
#delete characters after cursor
<alt>+d
#delete character before cursor
<ctrl>+h
#swap current word with prev word
<alt>+t
#swap two characters
<ctrl>+t
#undo keypress
<ctrl>+_
#cut the word before cursor
<ctrl>+w
#cut the part of line after cursor
<ctrl>+k
#cut the part of line before cursor
<ctrl>+u
#paste what you cut
<ctrl>+y
#clear screen
<ctrl>+l
#stop all output to screen
<ctrl>+s
#resume output to screen
<ctrl>+q
##
###

###system info
##info on cpu
less /proc/cpuinfo
##

###osx specific
##caffeinate
#prevent sleep
#prevent sleep for 1 hour
caffeinate -u -t 3600
#prevent sleep while process is running
#to get process id:
#ps aux | grep -i note | awk '{print $2}'
caffeinate -w <processid> #
##
##run applescript-code
osascript -e 'id of app "iTerm"'
##

##blueutil (brew)
#List paired devices
blueutil --paired
#connect to device
blueutil --connect <MAC>
#disconnect
blueutil --disconnect <MAC>
##

##disk
#display info on all disk
diskutil info -all
#display name of all disks
diskutil info -all | grep 'Device Identifier'
##
###
