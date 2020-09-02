# System::Stats::NETUsage
[![Build Status](https://travis-ci.com/ramiroencinas/System-Stats-NETUsage.svg?branch=master)](https://travis-ci.com/github/ramiroencinas/System-Stats-NETUsage)

Raku module - Provides Network Usage Stats.

## OS Supported: ##
* GNU/Linux by /proc/net/dev
* Win32 by netstat command

## Installing the module ##

    zef update
    zef install System::Stats::NETUsage

## Example Usage: ##

```raku 
use v6;
use System::Stats::NETUsage;

my %netUsage = NET_Usage();

say "\nNetwork Usage per second:\n";

say "Bytes received: " ~ %netUsage<bytesReceivedPerSecond>;
say "    Bytes sent: " ~ %netUsage<bytesSentPerSecond>;
```