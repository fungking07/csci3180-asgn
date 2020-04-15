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

my $land_price = 1000;
my @upgrade_fee = (1000, 2000, 5000);
my @toll = (500, 1000, 1500, 3000);
my @tax = (0.1, 0.15, 0.2, 0.25);
my $hfr = 0.1;

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
    
    # ...
    my $self = shift;
    local $Player::due = 0;
    if ($main::cur_player -> {money} < ($land_price * (1 + $hfr))){
        print "You do not have enough money to buy the land!\n";
    }else{
        $self -> {owner} = $main::cur_player;
        local $Player::due = 1000;
        local $Player::handling_fee_rate = $hfr;
    }

    $main::cur_player->payDue();
}

sub upgradeLand {

    # ... 
    my $self = shift;
    my $land_level = shift;
    local $Player::due = 0;
    if($main::cur_player -> {money} < ($upgrade_fee[$land_level] * (1 + $hfr))){
        print "You do not have enough money to upgrade the land!";
    }else{
        local $Player::due = $upgrade_fee[$land_level];
        local $Player::handling_fee_rate = $hfr;
        $self -> {level} += 1;
    }

    $main::cur_player->payDue();
}

sub chargeToll {

    # ...
    my $self = shift;
    my $land_level = shift;
    my $toll_fee = shift;
    if($main::cur_player -> {money} < $toll_fee){
        $toll_fee = $main::cur_player -> {money};
    }
    local $Player::due = $toll_fee;
    $main::cur_player->payDue();

    # ...
    local $Player::income = $toll_fee;
    local $Player::tax_rate = $tax[$land_level];
    local $Player::due = 0;
    $self->{owner}->payDue();
}

sub stepOn {

    # ...
    my $self = shift;
    unless($self -> {owner}){
        print "Pay \$1000 to buy the land? [y/n]\n";
        my $response = <STDIN>;
        chomp ($response);
        while ($response ne "y" && $response ne "n"){
            print "Pay \$1000 to buy the land? [y/n]\n";
            $response = <STDIN>;
            chomp ($response);
        }
        if($response eq "y"){
            $self -> buyLand();
        }
    }else{
        if($self -> {owner} -> {name} eq $main::cur_player -> {name}){
            my $land_level = $self -> {level};
                if($land_level < 3){
                    my $upgrade = $upgrade_fee[$land_level];
                    print "Pay $upgrade to upgrade the land? [y/n]\n";
                    my $response = <STDIN>;
                    chomp ($response);
                    while ($response ne "y" && $response ne "n"){
                        print "Pay $upgrade to upgrade the land? [y/n]\n";
                        $response = <STDIN>;
                        chomp ($response);
                    }
                    if($response eq "y"){
                        $self -> upgradeLand($land_level);
                    }
                }
        }else{
            my $land_level = $self -> {level};
            my $toll_fee = $toll[$land_level];
            print "You need to pay player $self->{owner}->{name} \$$toll_fee\n";
            $self -> chargeToll($land_level, $toll_fee);
        }
    }

}
1;