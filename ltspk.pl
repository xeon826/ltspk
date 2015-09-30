use Irssi;
use Irssi::Irc;
use strict;
use warnings;
use vars qw($VERSION %IRSSI);
$VERSION="0.0.1";
%IRSSI = (
	authors	=> 'Joshua \'Presley\' Wilkerson',
	contact	=> 'xeon826@gmail.com',
	name	=> 'alame',
	description	=> 'Converts towards l33t',
	license	=> 'GPL v2',
	url	=> 'http://',
);


# USAGE:
# /alame <text>
# writes "text" in l33t to the current channel

sub cmd_lamer {
  my ($data, $server, $witem) = @_;
  if (!$server || !$server->{connected}) {
    Irssi::print("Not connected to server");
    return;
  }
  if ($data) {
    my $x; $_=$data; s/./$x=rand(6); $x>3?lc($&):uc($&)/eg; s/a/4/gi;
    s/e/3/gi; s/l/L/gi; s/i/1/gi; s/k/|</gi; s/i/!/gi; s/n/N/gi; s/h/H/gi;
    s/you/j00/gi; s/lol/(lol)/gi; s/o/0/gi; s/u/v/gi; s/d/D/gi;	
    s/o/0/gi; s/s/5/gi; s/t/+/gi;
    s/T/t/gi;
     
    $witem->command("/SAY $_");
  }
}

Irssi::command_bind('alamer', 'cmd_lamer');
