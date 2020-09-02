use v6;
use lib 'lib';
use System::Stats::NETUsage;

my %netUsage = NET_Usage();

say "\nNetwork Usage per second:\n";

say "Bytes received: " ~ %netUsage<bytesReceivedPerSecond>;
say "    Bytes sent: " ~ %netUsage<bytesSentPerSecond>;

