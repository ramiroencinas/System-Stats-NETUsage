use v6;

unit module System::Stats::NETUsage;

sub NET_Usage ( ) is export {  

  my %shot1;
  my %shot2;
  
  given $*KERNEL {
    
    when /linux/ { 

      %shot1 = shot_linux();

      sleep 1;

      %shot2 = shot_linux();

    }

    when /win32/ {

      %shot1 = shot_win32();

      sleep 1;

      %shot2 = shot_win32();

    }    
  }

  return {

    'bytesReceivedPerSecond' => %shot2<received> - %shot1<received>,
    'bytesSentPerSecond'     => %shot2<sent> - %shot1<sent>

  }

}

sub shot_linux() {

  my $sourcefile = '/proc/net/dev';

  my $received = 0;
  my $sent     = 0;  

  for $sourcefile.IO.open.lines {

    if $_ ~~ /^.*?\:/ {

      $received += $_.words[1].Int;
      $sent     += $_.words[9].Int;
    }
  }

  return {
    'received' => $received,
    'sent'     => $sent
  }

}

sub shot_win32 ( ) {  

  my $received;
  my $sent;
  
  my @lines = ((shell "netstat -e", :out :enc<utf8-c8>).out.slurp).lines;

  for @lines {

    if $_ ~~ /Bytes\s+$<received>=[\d+]\s+$<sent>=[\d+]/ {

      $received = $<received>.Int;
      $sent = $<sent>.Int;

    }   

  }

  return {
    'received' => $received,
    'sent'     => $sent
  }

}

