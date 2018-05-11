#!/usr/bin/perl

use DBI;
use strict;

my $driverName = "SQLite";
my $databaseName = "data.db";
my $dataSource = "DBI:$driverName:$databaseName";
my $username = "";
my $password = "";
my $dbh = DBI->connect($dataSource, $username, $password, { RaiseError => 1 })
   or die $DBI::errstr;
my $stmt = qq(select * from tb_user;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
   print $DBI::errstr;
}else{
	print "\nTable Data :-\n";
	print "--------------------------------------------------\n";
	print "First Name \tLast Name\tHome \n";
	print "--------------------------------------------------\n";
	while(my @row = $sth->fetchrow_array()){
		print $row[0] . "\t\t" . $row[1] . "\t\t" . $row[2] . "\n";
	}
	print "--------------------------------------------------\n";
}
$dbh->disconnect();