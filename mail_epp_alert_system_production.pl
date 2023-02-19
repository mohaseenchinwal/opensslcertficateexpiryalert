#!/usr/bin/perl
use strict;
use warnings;

my $FILEPATH="/home/mohsin/epp_exp_notfication";
my $ms="/home/mohsin/epp_exp_notfication/epp_alert_system_production.pl";
my $PERL="/bin/perl";
my $BASH ="/bin/bash";
my $CAT="/bin/cat";
my $WC="/bin/wc";
my $E="/bin/echo";
my $DATA="$FILEPATH/output.html";
my $cnt=0;








`echo  "<!DOCTYPE html><html><head><style>table { width:75%\;}table, th, td { border: 1px solid black\;border-collapse: collapse\;}th, td { padding: 6px\; text-align: center\;}table#t01 tr:nth-child(even) {background-color: #eee\;}table#t01 tr:nth-child(odd) { background-color: #fff\;}table#t01 th {  background-color: #8f1336;\ color: white;\}</style></head><body><h2>Qatar Domains Registry Registrars EPP Certificates Information</h2><table id=\"t01\"><tr><th>Registrar Certificate</th> <th>Expiry Date</th> <th>Days Left for Expiry</th></tr>" > $DATA`;



`$PERL $ms >> $DATA`;

`echo  "</table></body></html>" >> $DATA`;


$cnt =`$CAT $DATA | $WC -l`;



if ($cnt >= 3)

{

my $cmd="\(
$E \"From: root\@registry.qa\";
$E \"To: tech\@domains.qa\";
$E \"Subject: Qatar Domains Registry Registrars EPP Certficates Expiry Information\";
$E \"Content-Type: text/html\";
$E \"MIME-Version: 1.0\";
$E \"\";
cat $DATA;
\) \| sendmail -t";

system($cmd); 




my $cmd2="\(
$E \"From: root\@registry.qa\";
$E \"To: support\@domains.qa\";
$E \"Subject: Qatar Domains Registry Registrars EPP Certficates Expiry Information\";
$E \"Content-Type: text/html\";
$E \"MIME-Version: 1.0\";
$E \"\";
cat $DATA;
\) \| sendmail -t";

system($cmd2);





my $cmd3="\(
$E \"From: root\@registry.qa\";
$E \"To: registrars\@domains.qa\";
$E \"Subject: Qatar Domains Registry Registrars EPP Certficates Expiry Information\";
$E \"Content-Type: text/html\";
$E \"MIME-Version: 1.0\";
$E \"\";
cat $DATA;
\) \| sendmail -t";

system($cmd3);



my $cmd4="\(
$E \"From: NAlMeraizeeq\@cra.gov.qa\";
$E \"To: registrars\@domains.qa\";
$E \"Subject: Qatar Domains Registry Registrars EPP Certficates Expiry Information\";
$E \"Content-Type: text/html\";
$E \"MIME-Version: 1.0\";
$E \"\";
cat $DATA;
\) \| sendmail -t";

#system($cmd4);










}
