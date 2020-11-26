

#$inputfile = "excel.txt";
$inputfile = "trial.txt";
$fileindex = 0;
open(A,$inputfile);
while(<A>) {
	chomp;
	my ($subservice, $url, $author) = (split /\t/, $_)[0, 1, 2];
	chomp($subservice);
	chomp($url);
	chomp($author);
	
	$url =~ /power-bi\/(.*)$/;
	$path = $1;
	$filepath = "./${path}.md";
	
	if (-e $filepath) {
	
		if ($author =~ /arthiriyer/) {$msauthor = "arthii";}
		if ($author =~ /davidiseminger/) {$msauthor = "davidi";}
		if ($author =~ /jtarquino/) {$msauthor = "jaimeta"}
		if ($author =~ /KesemSharabi/) {$msauthor = "kesharab";}
		if ($author =~ /kfollis/) {$msauthor = "kfollis";}
		if ($author =~ /maggiesMSFT/) {$msauthor = "maggies";}
		if ($author =~ /margoc/) {$msauthor = "margoc";}
		if ($author =~ /mihart/) {$msauthor = "mihart";}
		if ($author =~ /minewiskan/) {$msauthor = "owend";}
		if ($author =~ /mohaali/) {$msauthor = "mohaali";}
		if ($author =~ /NikhilGaekwad-MSFT/) {$msauthor = "nikhilga";}
		if ($author =~ /otarb/) {$msauthor = "otarb";}
		if ($author =~ /paulinbar/) {$msauthor = "painbar";}
		if ($author =~ /peter-myers/) {$msauthor = "v-pemyer";}
		if ($author =~ /rien/) {$msauthor = "rien";}
		if ($author =~ /willthom/) {$msauthor = "willthom";}

		open(C,">temp");
		open(B,$filepath);
		my $index = "notmeta";
		while(<B>) {
			if ($index eq "notmeta") {
				if (/^---\s*$/) {print C "$_"; $index = "meta"; next;}
			}
			elsif ($index eq "meta") {
				if (/^---\s*$/) {print C "$_"; $index = "done"; next;}
				elsif (/description:/) {print C "${_}author: $author\nms.author: $msauthor\n"; next;}
				elsif (/ms\.service:/) {print C "${_}ms.subservice: $subservice\n"; next;}
				elsif (/author:/ || /ms\.author:/ || /ms\.subservice:/ || /^\s*$/) {next;}
				else {print C "$_"; next;}	
			}
			else {print C "$_"; next;}

		}
		close B;
		close C;
		rename("temp",$filepath);
		#$fileindex++;
	}
	else {print "$filepath doesn't exist\n";}
}
close A;
#print $fileindex;