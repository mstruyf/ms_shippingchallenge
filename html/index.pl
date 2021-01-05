use strict;
use warnings;
use Tie::File;
use MongoDB;

my $client = MongoDB::MongoClient->new( host => '192.168.56.5', port => 27017);
my $db = $client->get_database("admin");
my $users = $db->get_collection("name");
my $all = $users->find();
my $var = $all->next;
my $naam = $var->{name};

open (HTML,">","/usr/src/myapp/index.html") || die $!;

print HTML "<!DOCTYPE html>
<html>
<head>
<title>Shipping Challenge</title>
<style>
body {font-family: Arial, Helvetica, sans-serif; text-align:center}
h3   {text-decoration: underline;}
</style>
</head>
<body>
<h3>Welkom op mijn Shipping Challenge webpagina!</h3>";
print HTML "
<p>Mijn naam is $naam.</p>";                                                                                            
print HTML "
</body>
</html>
";

close (HTML);
