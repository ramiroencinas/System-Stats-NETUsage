use v6;
use lib 'lib';
use Test;

plan 2;

use System::Stats::NETUsage;

my %netUsage = NET_Usage();

ok ( %netUsage<bytesReceivedPerSecond> >= 0 ), "Bytes received per second >= 0";
ok ( %netUsage<bytesSentPerSecond> >= 0 ), "Bytes sent per second >= 0";