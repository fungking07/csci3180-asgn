use strict;
use warnings;
 
package Player;
sub new {
    my $class = shift @_;
    my @cards = ();
    my $self = {
        _name => shift @_,
        _cards => \@cards,
    };
    my $object = bless $self, $class;
    return $object;
}

sub getCards {
    my $self = shift @_;
    my $card = shift @_;
    push(@{$self->{_cards}}, @{$card});
}

sub dealCards {
    my($self) = @_;
    my $cards = $self->{_cards};
    my $d_card = shift(@$cards);
    return $d_card;
}

sub numCards {
    my ($self) = @_;
    my $cards = $self->{_cards};
    return scalar @$cards;
}

return 1;