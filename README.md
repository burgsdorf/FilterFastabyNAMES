# FilterFastabyNAMES

The script reads two files. The first one must contain a pool of sequences and the second must contain a list of the genes/contigs you want to extract.
Input files:
1)A pool of contigs/genes can be in every variation of fasta format: header and sequence in one row or header and sequence in many rows.  
2)You must provide a list of the names (headers) without ">" in the beginning (for example "gi|16127995|ref|NP_414542.1| thr operon leader peptide [Escherichia coli str. K-12 substr. MG1655]")
Output file:
Output file will be created in the format of one row of header/one row of sequence. 

Usage:
perl -w FilterFastabyNAMES.pl FASTAwithCONTIGS.fasta LISTofNAMES.txt NAMEofOUTPUT.fasta

Examples:
A list of names (second input):
contig-70_12_length_86949_read-count_2486989
contig-70_14_length_84501_read-count_2343227
contig-70_25_length_60234_read-count_1682647
