

my $files = 'admin-articles.txt';
open(A,$files);
while(<A>) {
	chomp;
	$file = $_;
	open(B,$file);
	$title = "no";
	$code = "no";
	while(<B>) {
		chop;
		unless (/\(#tab\//) {
			if (/```/) {$code = "yes"; next;}
			if (/```/ && $code eq "yes") {$code = "no"; next;}
			if (/^# / && $code eq "no") {print "$_\n"; next;}
			if (/^## / && $code eq "no") {print "$_\n";}
		}
	}
}

__END__



$newstring =~ s/foo/bar/g;


my $file_content = read_file('text_document.txt');

open (A,"myfiles.txt");
while(<A>) {
    $file = $_;
	print $file;
	
}

__END__
    $code = 0;
    open(B,$file);
    while(B){
        chomp;
        if (/```/) {$code = 1;}
        if (/```/ && $code eq 1) {$code = 0;}
        unless ($code eq 1) {
		    if (/^(# |## )/) {print $code;}
		}
    }
	close B;
}
close A;