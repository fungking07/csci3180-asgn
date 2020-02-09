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


#include <stdio.h>
#include <stdlib.h>
#include <string.h> 

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
    exit(1);
  }
  course(fins, fcan);
  return 0;
}

void course(FILE *fins, FILE *fcan){

  /*
    File I/O
  */
  FILE *fout;

  /*
    check if instructor.txt is empty
  */
  int inssize;
  fseek(fins, 0, SEEK_END);
  inssize = ftell(fins);

  /*
    write an empty file
  */
  if (inssize == 0) {
    printf("instructors.txt is empty\n");
    fout = fopen("output.txt", "wb");
    //fprintf(fout,"");
    exit(1);
  }

  /*
    check if candidate.txt is empty
  */
  int cansize;
  fseek(fcan, 0, SEEK_END);
  cansize = ftell(fcan);

  /*
    write the file with placeholder SID for each course
  */
  if(cansize == 0){
    fseek(fins, 0, SEEK_SET);
    printf("candidates.txt is empty\n");
    char insbuffer[130];
    fout = fopen("output.txt", "w");
    while(fgets(insbuffer, sizeof(insbuffer), fins) != NULL){
      printf("%s\n", insbuffer);
      fprintf(fout, "%c%c%c%c 0000000000 0000000000 0000000000 \n", insbuffer[0], insbuffer[1], insbuffer[2], insbuffer[3]);
    }
    exit(1);
  }

  printf("Both file not empty!\n");
  fseek(fins, 0, SEEK_SET);
  fseek(fcan, 0, SEEK_SET);
  char insbuffer[130];
  char canbuffer[160];
  printf("Content as follows:\n");
  int ta_score[2][3] = {0, 0, 0, 0, 0, 0};
  while(fgets(insbuffer, sizeof(insbuffer), fins) != NULL){
    printf("%s\n", insbuffer);
    fseek(fcan, 0, SEEK_SET);
    
    while(fgets(canbuffer, sizeof(canbuffer), fcan) != NULL){
      printf("%s\n", canbuffer);
    }
    printf("\n");
  }
}