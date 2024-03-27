find /usr/bin -name *c
find /usr/bin -type l
find /usr | head
grep "model name" /proc/cpuinfo
grep -v "sudo" /etc/group | wc -l
grep "sudo" /etc/group | nl

echo "$(sort food -f)"
echo "$(sort food -r -f)"
echo "$(sort --key=2)"
sort -k3,3nr -k2,2nr --numeric-sort food > calo

