jid=$(top -n1 | grep -m1 java | perl -pe 's/\e\[?.*?[\@-~] ?//g' | cut -f1 -d' ')
echo 'Top java pid='$jid
jstack $jid > /tmp/$jid.jstack
echo '/tmp/'$jid.jstack
jthread_id=$(top -n1 -H | grep -m1 java | perl -pe 's/\e\[?.*?[\@-~] ?//g' | cut -f1 -d' ')
echo 'slow thread id='$jthread_id
printf -v jthread_id_hex "%x" "$jthread_id"
echo 'slow thread id=0x'$jthread_id_hex
fgrep -A10 '0x'$jthread_id_hex /tmp/$jid.jstack
