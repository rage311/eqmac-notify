eqmac-notify
============

Scripts to run in the background and notify you via email of happenings in your EQ Mac client.


First, you will need to set postfix up to send email properly.
This guide is a perfect walkthrough if you will be using gmail to send your notification emails:
http://www.anujgakhar.com/2011/12/09/using-macosx-lion-command-line-mail-with-gmail-as-smtp/

If you use another outgoing email provider, just google for a walkthrough (eg "osx postfix hotmail").

To test your outgoing email, run this:
  
  $ echo "test" | mail -s "test subject" youremail@domain.com


Put the included files in your user's Documents directory, in a folder called eqmac-notify.
For clarification, the .sh file's complete path should be /Users/$USER/Documents/eqmac-notify/eqmac-notify.sh

In a terminal, run the following (note, the $ is an indication of a regular user's prompt, there is no need to type the $):
  
  $ cd ~/Documents/eqmac-notify
  
  $ crontab ./crontab
  
  $ chmod u+x ./eqmac-notify.sh
