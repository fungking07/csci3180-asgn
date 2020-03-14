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

public class Task4Soldier extends Soldier{
  private int coins;
  private int shield;

  public Task4Soldier() {
    super();
    coins = 0;
    shield = 0;
  }
  
  @Override
  public boolean loseHealth() {
    if (this.shield * 5 >= 10){
      this.health -= 0;
    }else{
      this.health -= (10 - this.shield * 5);
    }
    return this.health <= 0;
  }

  @Override
  public void displayInformation() {
    super.displayInformation();
    System.out.printf("Defence: %d.%n", getShield() * 5);
    System.out.printf("Coins: %d.%n", getCoins());
  }

  public int getCoins(){
    return this.coins;
  }

  public int getShield(){
    return this.shield;
  }

  public void addCoins(){
    this.coins += 1;
  }

  public void removeCoins(int amount){
    this.coins -= amount;
  }

  public void addShield(){
    this.shield += 1;
  }
}