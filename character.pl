#!/usr/bin/perl
#List of patterns:
#CHARACTER_TERMINATION: NORMAL race=Dwarf ; class=Paladin
#CHARACTER_TERMINATION: SUICIDE race=Dwarf ; class=Paladin
#CHARACTER_TERMINATION: NOGHOST race=Dwarf ; class=Paladin
#CHARACTER_CREATION: race=Vampire ; class=Istar ; mode=0

die ("unable to find character.log\n") if (!open (F, "character.log"));
while (<F>) {
  if (/TERMINATION: (\w+) race=(\w+) ; class=(\w+)/) {
    $race{$2}++;
    $type{$1}++;
    $class{$3}++;
    $death_type{"$1,$2,$3"}++;
    $death_class{$2}++;
  } elsif (/CREATION: race=([\w]+) ; class=([\w]+) ; mode=([\d]+)/) {
    $birth_race{$1}++;
    $birth_class{$2}++;
    $birth{"$1,$2"}++;
  } elsif (/WINNER: race=(\w+) ; class=(\w+)/) {
    $winner{"$1,$2"}++;
  } 
}
%tmp = %race;
%race = %class;
%class = %tmp;
printf ("DEATH TABLE:\n");
foreach $t (sort keys %type) {
printf "$t/"
}printf("deaths \n");
printf "%18s|", "";
foreach $c (sort keys %class) {
  $class_out = "$c ($class{$c})";
  printf "%24s|", $class_out;
}
printf "\n";
foreach $r (sort keys %race) {
  $race_out = "$r ($race{$r})";
  printf "%18s|", $race_out;
  foreach $c (sort keys %class) { 
    printf "";
    foreach $t (sort keys %type) {
       printf "%3d,", $death_type{"$t,$c,$r"};
    }
    printf "|";
  } 
  printf "\n";
}
%tmp = %race;
%race = %class;
%class = %tmp;
printf "\n\nBIRTH TABLE:\n";
printf "%18s|", "";
foreach $r (sort keys %race) {
  $race_out = "$r ($birth_race{$r})";
  printf "%19s|", $race_out;
}
printf "\n";
foreach $c (sort keys %class) {
  $class_out = "$c ($birth_class{$c})";
  printf "%18s|", $class_out;
  foreach $r (sort keys %race) { 
    printf "%19d|", $birth{"$r,$c"};
  } 
  printf "\n";
}
printf "\n\nWINNERS:\n";
foreach $w (sort keys %winner) {
 my ($r, $c) = split /,/, $w;
 printf "%d $r $c killed Morgoth.\n", $winner{$w};
}
