#!/usr/bin/perl
use strict;
use warnings;

my $html="/home/mohsin/epp_exp_notfication/output.html";
my $CERTPATH="/home/mohsin/epp_exp_notfication/prodcerts/";
my $output;
my $i;


#`echo  "<!DOCTYPE html><html><head><style>table { width:100%\;}table, th, td { border: 1px solid blue\;border-collapse: collapse\;}th, td { padding: 15px\; text-align: left\;}table#t01 tr:nth-child(even) {background-color: #eee\;}table#t01 tr:nth-child(odd) { background-color: #fff\;}table#t01 th {  background-color: blue;\ color: white;\}</style></head><body><h2>Styling Tables></h2><table id=\"t01\"><tr><th>Registrar Certficate</th> <th>Expiry Date</th> <th>Days Left for Expiry</th></tr>" > $html`;



opendir DIR, $CERTPATH or die "Can't open $CERTPATH: $!";
my @cert_files = sort grep { -f "$CERTPATH/$_" } readdir DIR;


for  $i (@cert_files) {


$output=`openssl x509 -noout -enddate -in  $CERTPATH/$i | cut -d= -f 2`;

my $c="date -d \"$output\" --utc +\"%Y-%m-%d\"";
my $td=`date --utc +%Y-%m-%d`;
my $output2=`$c`;
my $ss= `date -d "$td" '+%s'`;
my $ee= `date -d "$output2" '+%s'`;

my $days= (($ee - $ss )/(60*60*24));


my $dispdate="date -d \"$output\" --utc +\"%d-%m-%Y\"";
my $dispdate1=`$dispdate`;
chomp $dispdate1;


if ($days >= 30)
            {
  
               next;
            }



        if($days <= 0)

                  {
                       $days = "Already Expired";
                  }






      print "<tr><td>$i</td><td>$dispdate1</td><td>$days</td></tr>\n";
}
