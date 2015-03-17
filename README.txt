  =====      SneakSync      =====

sneaksync is a program for keeping a large repository of files
synchronized with another one, using a relatively small cloud-based
shared directory.

Sections:
  USE CASE
  INSTALLATION
  USAGE
  CONFIGURATION

== USE CASE ==
The use case is as follows:

I have a home machine I would like to keep a remote backup of.  I have
a machine at another location, that I have USB hard drive connected
to.  These machines can not directly communicate with each other over
the Internet, but they both have access to a shared network directory
of about 5G.  In total I have about 500G of media files I'd like to
keep backed-up.

sneaksync makes it possible to transfer updates from my home machine
to the other machine, using the shared network directory.  Basically
it copies batches of files at a time, no larger than the limit of
my shared network directory.  It also supports transferring files
larger than the shared directory size, by breaking large files into
pieces, and transferring the pieces individually.

== INSTALLATION ==
sneaksync is a single python script.  Place it on your path, or
make a crontab entry for it, to run periodically.  If you run
in manually, you can put it anywhere.  It expects python
in /usr/bin, but you can invoke it by running
  $ python sneaksync <args>

Create a directory in the local folder or directory of your network
shared (cloud) directory where your synchronization transfers will
take place.

=== On the sending side
Create a configuration file on the sending machine, indicating the
source directory to be synchronized, the shared (sync) directory,
and the limits associated with the sync directory.

Run sneaksync for the first time using the '-i' option, to initialize
the data file for the source directory, specifying the config file you
created above.

=== On the receiving side
Create a configuration file on the receiving machine, indicating the
the shared (sync) directory and the destination directory.

Run sneaksync for the first time using the '-i' option and the '-r'
option (indicating receive mode), to initialize the data file for the
destination directory, specifying the config file you created above.

== USAGE ==

You can get usage information for sneaksync with the '-h' option.  It
is run in either sending or receiving mode (use '-r' for receiving
mode).  There are options to control the verbosity of output, to
specify a log file, to specify exclude patterns, and to put the
program in a loop.

You can run the program manually, but it probably makes more sense
to set up the program to be run automatically using, for example, 
cron or the Windows 'AT' command.  If you don't mind the program
running continuously, you can use the '-p' option to have it
run in a loop, periodically waking up to check for updates.

== CONFIGURATION ==
Here are example configuration files from my system, backing up my home
Pictures directory on a Windows machine to a USB drive on a Linux machine:

sneaksync-sender.conf:
  source_dir=C:/Users/Family/Pictures
  sync_dir=C:/Users/Family/Dropbox/sneaksync-transfer
  transfer_size_limit=2000000000
  transfer_count_limit=2000

sneaksync-receiver.conf:
  dest_dir=/media/My Passport/home-backup/Pictures
  sync_dir=/home/tbird/Dropbox/sneaksync-transfer

See the documentation for detailed information about the configuration
options.

IMPORTANT NOTE: It is a bad idea, security-wise, to put either the
sender or receiver config file in any of the directories manipulated
by the program: the source directory, sync directory or the
destination directory.

