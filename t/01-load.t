use v6;
use lib 'lib';
use Test;

plan 2;

use System::Stats::NETUsage;
ok 1, "use System::Stats::NETUsage worked!";
use-ok 'System::Stats::NETUsage';