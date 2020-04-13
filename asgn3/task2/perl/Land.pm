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
package Land;

$land_price = 1000
@upgrade_fee = (1000, 2000, 5000)
@toll = (500, 1000, 1500, 3000)
@tax_rate = [0.1, 0.15, 0.2, 0.25]

sub new {
    my $class = shift;
    my $self  = {
        owner => undef,
        level => 0,
    };
    bless $self, $class;
    return $self;
}

sub print {
    my $self = shift;
    if (!defined($self->{owner})) {
        print("Land ");
    } else {
        print("$self->{owner}->{name}:Lv$self->{level}");
    }
}

sub buyLand {
    local $due = 0;
    if ($response eq "y"){
        if ($main::cur_player -> {money} < 1100){
            print "You do not have enough money to buy the land!\n";
        }else{
            local $due = 1000;
            local $handling_fee_rate = 0.1;
            $self -> {owner} = $main::cur_player;
        }
    }
    $main::cur_player->payDue();
}

sub upgradeLand {
    local $due = 0;
    local $handling_fee_rate = 0.1;
    $main::cur_player->payDue();
}

sub chargeToll {

    # ...
    local $handling_fee_rate = 0;
    if($self -> {level} == 0){
        local $due = 500;
    }

    $main::cur_player->payDue();

    # ...

    $self->{owner}->payDue();
}

sub stepOn {

    # ...
    unless($self -> {owner}){
        print "Pay $land_price to buy the land?  [y/n]\n"
        my $response = <STDIN>;
        chomp ($response);
        while ($response ne "y" || $response ne "n"){
            $response = <STDIN>;
            chomp ($response);
        }

    }else{
        if($self -> {owner} eq $cur_player -> {name}){
            $self -> upgradeLand();
        }else{
            $self -> chargeToll();
        }
    }

}
1;