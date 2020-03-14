/*
 * CSCI3180 Principles of Programming Languages
 *
 * --- Declaration ---
 *
 * I declare that the assignment here submitted is original except for source
 * material explicitly acknowledged. I also acknowledge that I am aware of
 * University policy and regulations on honesty in academic work, and of the
 * disciplinary guidelines and procedures applicable to breaches of such policy
 * and regulations, as contained in the website
 * http://www.cuhk.edu.hk/policy/academichonesty/
 *
 * Assignment 2
 * Name : Lam King Fung
 * Student ID : 1155108968
 * Email Addr : kflam8@cse.cuhk.edu.hk
 */

import java.util.Scanner;

public class Task4Merchant {
  private int elixirPrice;
  private int shieldPrice;
  private Pos pos;

  public Task4Merchant() {
    // TODO: Initialization.
    elixirPrice = 1;
    shieldPrice = 2;
    pos = new Pos();
  }
  public void setPos(int row, int column) {
    this.pos.setPos(row, column);
  }

  public Pos getPos() {
    return this.pos;
  }

  public void actionOnSoldier(Task4Soldier soldier) {
    this.talk("Do you want to buy something? (1. Elixir, 2. Shield) Input: ");
    // TODO: Main logic.
      Scanner sc = new Scanner(System.in);
      String choice = sc.nextLine();
      if(choice.equalsIgnoreCase("1")){
        if(soldier.getCoins() >= this.elixirPrice){
          soldier.addElixir();
          soldier.removeCoins(this.elixirPrice);
          this.talk("I'll take 1 coin from you, and here is your elixir. Thank You!");
        } else {
          this.talk("How pathetic! This poor player wants to buy elixir without paying the right amount. Get out of here!");
        }
      }else if(choice.equalsIgnoreCase("2")){
        if(soldier.getCoins() >= this.shieldPrice){
          soldier.addShield();
          soldier.removeCoins(this.shieldPrice);
          this.talk("I'll take 2 coins from you, and here is your shield. Thank You!");
        } else {
          this.talk("How pathetic! This poor player wants to buy shield without paying the right amount. Get out of here!");
        }
      }else{
        System.out.printf("=> Illegal choice!%n%n");
      }

  }

  public void talk(String text) {
    System.out.printf("Merchant$: " + text);
  }

  // TODO: Other functions.
  public void displaySymbol() {
    System.out.printf("$");
  }
}