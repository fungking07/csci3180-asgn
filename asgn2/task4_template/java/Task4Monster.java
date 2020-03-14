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

public class Task4Monster extends Monster{

  public Task4Monster(int monsterID, int healthCapacity) {
    super(monsterID, healthCapacity);
  }

  @Override
  public void actionOnSoldier(Task4Soldier soldier) {
    if (soldier.getHealth() <= 0) {
      this.talk("You had defeated me, and here is a coin for you.%n%n");
      soldier.addCoins();
    } else {
      if (this.requireKey(soldier.getKeys())) {
        this.fight(soldier);
      } else {
        this.displayHints();
      }
    }
  }
}