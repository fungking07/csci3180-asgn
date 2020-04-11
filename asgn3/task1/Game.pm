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
	my $deck = new MannerDeckStudent();
	my @players = ();
	my @cards = ();
	my $object = bless {"Deck"=>\$deck, "players"=>\@players, "cards"=>\@cards};
}

sub setPlayers {
	@players = @_;
	my $player = new Player(@players);
}

sub getReturn {
	#take the cards btw two same val card
	#take card 1 by 1
	$last = pop(@{self->{"Deck"}});

	return $decksize;
}

sub showCards {
	
}

sub startGame {

}

return 1;
