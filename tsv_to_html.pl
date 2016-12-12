#usr/bin/perl

# Creates a HTML table from a TSV file

use warnings;
use strict;

my $tsv_input 	= $ARGV[0]."_table.tsv";
my $html_output = $ARGV[0]."_table.html";
my $fasta 	= $ARGV[0]."_proteins.fa";
my $table_name 	= $ARGV[0]; $table_name =~ s/\_/ /g;

#print "$tsv_input\n";##
#print "$html_output\n";
#print "$fasta\n"; ##
#print "$table_name\n"; ##


my @column_names;
my $i=0;

open (TSV, $tsv_input) or die $!;
while(<TSV>){}; seek TSV,0,0;
my $proteins = $. - 1;


open (STDOUT, ">$html_output") or die $!;


print <<END;
<html>

<head>
	<script type=\"text/javascript\" src=\"http://code.jquery.com/jquery-latest.min.js\"></script>
 	<link rel=\"stylesheet\" type=\"text/css\" href=\"//cdn.datatables.net/1.10.12/css/jquery.dataTables.css\">
 	<script type=\"text/javascript\" charset=\"utf8\" src=\"//cdn.datatables.net/1.10.12/js/jquery.dataTables.js\"></script>
</head>
END

print 	"<address>By <b>Juan Carlos Gonzalez Sanchez</b> (juancarlosgonzs\@gmail.com) and <b>Nicola Bordin</b> (nbor1\@upo.es)<br>\n",
		"Centro Andaluz de Biologia del Desarrollo. Universidad Pablo de Olavide. Sevilla<br>\n",
		"1 May 2015</address>\n",

		"<h1>$table_name ($proteins proteins)</h1>\n\n",

		"<p>The proteins sequeneces in FASTA format used in this analysis can be downloaded\n",
		"<a href=\"$fasta\" download>here</a>\n",
		".</p>\n",
		"<p>The complete table is also available in \n",
		"<a href=\"$tsv_input\" download>.tsv</a>\n",
		"format for downloading.</p>\n",
		"<table id=\"table1\" width=\"100%\" class=\"table table-condensed\">\n",
		"<thead>\n";

#chomp ($_ = <STDIN>);
#s?\t?</th><th>?g;


# Read input TSV file and print content in rows
while (my $line = <TSV>) {
	$i++;

	# Print column names  ~ parses them from the file 1st row.
	if ($i == 1) {
		@column_names = split ('\t', $line);
		print "<tr>\n";
		foreach my $name (@column_names) {

			# Setting specific witdths
#			if ($name =~ /Protein Length/) { print "<th id=\"length\">";}

#			else {

			print "<th>";
			print "$name</th>\n";
		}
		print "</tr>\n</thead>\n<tbody>\n";

	} else {
		print "<tr>\n";
		my @fields = split('\t', $line);

		for my $cell(@fields) {

	# The fuck is this?
	#		if($cell =~ /^(\d|\s)+$/) {
	#			print "<td align=\"right\">$cell</td>";
	#		} else {
				print "<td>$cell</td>";
	#		}
		}
		print "</tr>\n";
	}
}

print <<END
</tr>

</table>
</tbody>
<script>
\$(document).ready( function () {
    \$(\'#table1\').DataTable();
} );
</script>
</html>
END
