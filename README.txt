Scripts for cleaning up disk partitions for backup. The partitions
contained non-ascii filenames that would break during backup. Also,
target filesystem was not case sensitive which caused problems.

The process

1. Find and normalize problematic filenames
   See find-and-normalize.txt

2. Copy the directories
   $ cp -a foo bar /media/backup

3. Scan the copied files to ensure that all was copied
   $ ./scan.sh source
   $ ./scan.sh target

4. Compare the file listings
   $ ./compare | less
   If there's differences, start over from step 1 :-)

5. Verify file contents with md5sum
   $ ./verify.sh

