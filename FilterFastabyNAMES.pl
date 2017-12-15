use strict;
#first file is a contig pool ($inFileFasta), second one is a list of names of the contigs you want to extract ($inFileNames)
my ($inFileFasta, $inFileNames, $outFile) = @ARGV;
open (my $in1, "<", $inFileFasta) or die "cannot open $inFileFasta";
open (my $in2, "<", $inFileNames) or die "cannot open $inFileNames";
open(my $out, ">>", $outFile) or die "cannot open $outFile";

#insert all list of names to the list "@names" where each cell containing different name
my @names = <$in2>;    
chomp  @names;
    
#read first line from infile1 which is must be a header of the first sequence 
my $fastaLine = <$in1>;                  #>name of the header
chomp $fastaLine;
while (defined $fastaLine) {
	chomp $fastaLine;
	              
	my $header = $fastaLine;                               #twice cut to the header    
	my $seq = "";
	#read first line of the sequence under the header       
	$fastaLine = <$in1>;                                         
       
        
        #insert whole sequence to the temporal $seq file
	while ((defined $fastaLine) and
    (substr($fastaLine,0,1) ne ">" )){			
	       	chomp $fastaLine;
	        $seq = $seq.$fastaLine;
	        $fastaLine = <$in1>;
	}
	#check the gene against list of names		
	foreach my $name (@names){
	    
		if (substr($header,1) eq $name){	          #name of the header            
			print $out "$header\n";
			my @allseq = split (//, $seq);           #long seq will be splitted into array a/g/t/a/a/a/g/g/g
			my $printnuc = "";
			my $nucl = shift(@allseq);                   #a   
			
			while (defined $nucl) {            
				print $out $nucl;                     #a
				
			 	$nucl = shift(@allseq);               #g ...
			}	
			print $out "\n";
		}
	}
		
	#read a new header		
	#$fastaLine = <$in1>; 
}							
close($in1);
close($in2);
close($out);



