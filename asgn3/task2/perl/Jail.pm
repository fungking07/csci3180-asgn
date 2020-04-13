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
require "./Player.pm";

package Jail;
sub new {
    my $class = shift;
    my $self  = {};
    bless $self, $class;
    return $self;
}

sub print {
    print("Jail ");
}

sub stepOn {
    print "Pay \$1000 to reducethe prison round to 1?  [y/n]\n";
    my $response = <STDIN>;
    chomp ($response);
    while ($response ne "y" || $response ne "n"){
        print "Pay \$1000 to reducethe prison round to 1?  [y/n]\n";
        $response = <STDIN>;
        chomp ($response);
    }
    my $jail = 2;
    if ($response eq "y"){
        if ($main::cur_player -> {money} < 1100){
            print "You do not have enough money to reduce the prison round!\n";
        }else{
            $jail = 1;
            local $due = 1000;
            local $handling_fee_rate = 0.1;
            $main::cur_player -> payDue();
        }
    }
    local $prison_rounds = $jail;
    $main::cur_player->putToJail();
}

1;
