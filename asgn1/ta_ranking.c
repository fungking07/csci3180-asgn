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

void course(FILE *fins, FILE *fcan);

int main(int argc, char const *argv[]) {
  /*
    File I/O
  */
  FILE *fcan,*fins;
  fcan = fopen("candidates.txt", "r");
  fins = fopen("instructors.txt", "r");
  /*
    check if the file exist
  */
  if(fcan == NULL || fins == NULL){
    printf("non-existing file!\n");
    fclose(fcan);
    fclose(fins);
    exit(1);
  }
  course(fins, fcan);
  return 0;
}

void course(FILE *fins, FILE *fcan){
  FILE *fout;
  /*
    check if instructor.txt is empty
  */
  int inssize;
  fseek(fins, 0, SEEK_END);
  inssize = ftell(fins);
  if (inssize == 0) {
    printf("instructors.txt is empty\n");
    fout = fopen("output.txt", "wb");
    fprintf(fout,"");
    fclose(fcan);
    fclose(fins);
    exit(1);
  }

  /*
    check if candidate.txt is empty
  */
  int cansize;
  fseek(fcan, 0, SEEK_END);
  cansize = ftell(fcan);
  if(cansize == 0){
    printf("candidates.txt is empty\n");
    char codebuffer[127];
    while(fgets(codebuffer, 127, fins) != NULL){
      printf("there is content!\n");
      printf("%s",codebuffer);
    }
    printf("wrong code!\n");
    fclose(fcan);
    fclose(fins);
    exit(1);
  }
  printf("Both file not empty!\n");
}