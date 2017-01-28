# get file names and save them in a file (e.g. fnames) to keep a record of downloaded files
wget -O - http://bangortalk.org.uk/chats/miami/ | sed -n 's/.*href="\([^"]*\).*/\1/p' | tail -n+3 > fnames
# now it's time to actually download the files
while read p; do
    wget http://bangortalk.org.uk/chats/miami/$p
done <fnames
