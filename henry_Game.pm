use strict;
use warnings;

package Game;
use MannerDeckStudent; 
use Player;

sub new {
    my $class = shift @_;
    my @players = (); #have player before start game 
    my @cards = (); #stack
    my $self = { #change it tmr
        _Deck => new MannerDeckStudent(),
        _player => \@players,
        _cards => \@cards,
    };
    my $object = bless $self, $class;
    return $object;
}

sub set_players {
    my ( $self, $name) = @_;
    my @players_names = @$name;
    foreach my $item(@players_names){
        push(@{$self->{_player}}, new Player($item));
    }
    return 1;
}

sub getReturn { 
    my ($self) = @_;
    my @cards = @{$self->{_cards}};
    my $stop = -1;
    if ($cards[$#cards] eq "J" && ~~@cards != 1){
        return (~~@cards);
    }
    for(my $ind = 0; $ind < ~~@cards; $ind += 1){
        if ($cards[$ind] eq $cards[$#cards]){
            $stop = $ind;
            last;
        }
    }
    $stop = ~~@cards - $stop;
    if($stop==1){
        $stop = 0;
    }
    return $stop;
}

sub showCards {
    my ($self) = @_;
    my @cards = @{$self->{_cards}};
	print ("@cards\n");
}

sub start_game {
    my ($self) = @_;
    my $players_num = ~~@{$self->{_player}};
    my $round = 0;
    if (52 % $players_num){ #0->false
        print("Error: cards' number 52 can not be divided by players number $players_num!\n\n");
        exit(1);
    } 
    print("There $players_num players in the game:\n");
    my @players= @{$self->{_player}};
    foreach (@players){
        my $myname = $_->{_name};
        print ("$myname ");
    }
    $self->{_Deck}->shuffle();
    my @card_ref = $self->{_Deck}->AveDealCards($players_num);
    for(my $ind=0; $ind < ~~@players; $ind++){
        $players[$ind]->getCards($card_ref[$ind]);
    }
    print("\n\nGame begin!!!\n\n");
    
    my $game_flag = 1;
    while ($game_flag){
        $round +=1;
        foreach (@players){
            my $myname = $_->{_name};
            my $num = $_->numCards();
            if ($num == 0){
                next;
            }
            print ("Player $myname has $num cards before deal.\n");
            print ("=====Before player's deal=======\n");
            $self->showCards();
            print("================================\n");
            my $dual_card = $_->dealCards();
            print("$myname ==> card $dual_card\n");
            push(@{$self->{_cards}}, $dual_card);

            my $get_num = $self->getReturn();
            
            if($get_num){
                my @stack_card = ();
                for (my $ind = 0; $ind < $get_num; $ind++){
                    push @stack_card, pop(@{$self->{_cards}});
                }
                $_->getCards(\@stack_card);
                #array-> get card
            }
            
            $num = $_->numCards();
            print("=====After player's deal=======\n");
            $self->showCards();
            print("================================\n");
            print ("Player $myname has $num cards after deal.\n");

            if ($num eq 0){
                print("Player $myname has no cards, out!\n");
            }
            print("\n");

            $game_flag = 0;
            foreach (@players){
                if($_->numCards()){
                    $myname = $_->{_name};
                    $game_flag += 1;
                }
            }
            $game_flag -= 1;
            if($game_flag == 0){
            print("Winner is $myname in game $round\n");
                last;
            }
        }
        if ($round == 100){
            last;
        }
        
    }
}

return 1;