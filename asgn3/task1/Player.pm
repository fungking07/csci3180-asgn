 # CSCI3180 Principles of Programming Languages
 #
 # --- Declaration ---
 #
 # I declare that the assignment here submitted is original except for source
 # material explicitly acknowledged. I also acknowledge that I am aware of
 # University policy and regulations on honesty in academic work, and of the
 # disciplinary guidelines and procedures applicable to breaches of such policy
 # and regulations, as contained in the website
 # http://www.cuhk.edu.hk/policy/academichonesty/
 #
 # Assignment 3
 # Name : Lam King Fung
 # Student ID : 1155108968
 # Email Addr : kflam8@cse.cuhk.edu.hk

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
 
package Player;
sub new {
  my $class = shift @_;
  my @cards = {};
  my $self = {
    _name = shift @_;
    _cards = \@cards;
  }
  my $object = bless $self, $class;
  return $object;
}

sub getCards {
  my ($self, $cards) = @_;
  push(@{$self->{_cards}}, _cards);
}

sub dealCards {
  my $self = @_;
  my $cards = $self -> {_cards};
  my $deal = shift(@$cards);
  return $deal;
}

sub numCards {
  my $self = @_;
  my $cards = $self -> {_cards};
  return scalar @$cards;
}

return 1;