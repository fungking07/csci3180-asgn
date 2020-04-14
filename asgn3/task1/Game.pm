#/*
# * CSCI3180 Principles of Programming Languages
# *
# * --- Declaration ---
# *
# * I declare that the assignment here submitted is original except for source
# * material explicitly acknowledged. I also acknowledge that I am aware of
# * University policy and regulations on honesty in academic work, and of the
# * disciplinary guidelines and procedures applicable to breaches of such policy
# * and regulations, as contained in the website
# * http://www.cuhk.edu.hk/policy/academichonesty/
# *
# * Assignment 3
# * Name : Lam King Fung
# * Student ID : 1155108968
# * Email Addr : kflam8@cse.cuhk.edu.hk
# */


use strict;
use warnings;

package Game;
use MannerDeckStudent; 
use Player;

sub new {
	my $class = shift @_;
	my @players = ();
	my @cards = ();
	my $self = {
		_deck => new MannerDeckStudent(),
		_players => \@players,
		_cards => \@cards,
	};
	my $object = bless $self, $class;
	return $object;
}

sub set_players {
	my ($self, $name) = @_;
	my @players_name = @$name;
	foreach my $player_name(@players_name){
		push(@{$self -> {_players}}, new Player($player_name));
	}
	#print "ABC\n";
	return 1;
}

sub getReturn { 
	#take the cards btw two same val card
	#take card 1 by 1
    my ($self) = @_;
    my @cards = @{$self->{_cards}};
    my $index = -1;
		if($cards[$#cards] eq "J" && ~~@cards != 1){
			return (~~@cards);
		}
		my $i = 0;
		while($i < ~~@cards){
			if($cards[$i] eq $cards[$#cards]){
				$index = $i;
				last;
			}
			$i += 1;
		}
		$index = ~~@cards - $index;
		if($index == 1){
			$index = 0;
		}
		return $index;
}


sub showCards {
	my ($self) = @_;
	my @cards = @{$self -> {_cards}};
	print("@cards\n");
}

sub start_game {
	my ($self) = @_;
	my $numofplayers = ~~@{$self -> {_players}};
	my $turn = 0;
	if (52 % $numofplayers){
		print "Error: cards' number 52 can not be divided by players number $numofplayers!\n";
		exit(1);
	};
	print "There $numofplayers players in the game:\n";
	my @players = @{$self -> {_players}};
	foreach (@players){
		my $name = $_ -> {_name};
		print "$name ";
	}

	$self -> {_deck} -> shuffle();
	my @shuffled_deck = $self -> {_deck} -> AveDealCards($numofplayers);
	my $i = 0;
	while($i < ~~@players){
		$players[$i] -> getCards($shuffled_deck[$i]);
		$i += 1;
	}
	print "\n\n";
	print "Game begin!!!";
	print "\n\n";

	my $flag = 1;
	while($flag){
		$turn += 1;
		foreach (@players){
			my $name = $_ -> {_name};
			my $numofcard = $_ -> numCards();
			if($numofcard == 0){
				next;
			}
			print "Player $name has $numofcard cards before deal.\n";
			print "=====Before player's deal=======\n";
			$self -> showCards();
			print "================================\n";
			my $dealt = $_ -> dealCards();
			print "$name ==> card $dealt\n";
			push(@{$self -> {_cards}}, $dealt);

			my $get_retuen = $self->getReturn();
			if($get_retuen){
				my @stack = ();
				my $i = 0;
				while($i < $get_retuen){
					push @stack, pop(@{$self->{_cards}});
					$i += 1;
				}
				$_ -> getCards(\@stack);
			}
			

			$numofcard = $_ -> numCards();
			print "=====After player's deal=======\n";
			$self -> showCards();
			print "================================\n";
			print "Player $name has $numofcard cards after deal.\n";

			if($numofcard eq 0){
				print "Player $name has no cards, out!\n";
			}
			print "\n";
			$flag = 0;
			foreach(@players){
				if ($_ -> numCards()){
					$name = $_ -> {_name};
					$flag += 1;
				}
			}
			$flag -= 1;
			if($flag == 0){
				print("Winner is $name in game $turn\n");
				last;
			}
		}
	}
}

return 1;
