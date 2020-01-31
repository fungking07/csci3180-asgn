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
 * Assignment 1
 * Name : Lam King Fung
 * Student ID : 1155108968
 * Email Addr : kflam8@cse.cuhk.edu.hk
 */


#include "stdio.h"
#include "stdlib.h"

int main(int argc, char const *argv[]) {
  /*
    File I/O
  */
  FILE *fcan,*fins, *fout;
  fcan = fopen("candidates.txt", "r");
  fins = fopen("instructors.txt", "r");
  if(fcan == NULL || fins == NULL){
    printf("non-existing file!\n");
    exit(1);
  }
  fout = fopen("output.txt","wb");
  return 0;
}

char course(FILE *fins, FILE *fcan, FILE *fout){
  
}