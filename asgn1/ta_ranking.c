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
#include <stdbool.h>

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
    //printf("instructors.txt is empty\n");
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
    //printf("candidates.txt is empty\n");
    char insbuffer[130];
    fout = fopen("output.txt", "wb");
    while(fgets(insbuffer, sizeof(insbuffer), fins) != NULL){
      //printf("%s\n", insbuffer);
      char *cCode;
      cCode = strndup(insbuffer, 5);
      fprintf(fout, "%s0000000000 0000000000 0000000000 \n", cCode);
    }
    exit(1);
  }

  /*
    If the files are not empty
  */

  //printf("Both file not empty!\n");
  fout = fopen("output.txt", "wb");
  fseek(fins, 0, SEEK_SET);
  fseek(fcan, 0, SEEK_SET);
  char insbuffer[130];
  char canbuffer[160];
  //printf("Content as follows:\n");
  while(fgets(insbuffer, sizeof(insbuffer), fins) != NULL){

    /*
      Setting up the variable of each course parsed
    */

    /*
      placeholder SIDs
    */
    char firstPlace[15] = "0000000000 ";
    char secondPlace[15] = "0000000000 ";
    char thirdPlace[15] = "0000000000 ";
    float ta_score[3] = {0, 0, 0};
    char *cCode, *cReqSkill1, *cReqSkill2, *cReqSkill3, *cOptSkill1, *cOptSkill2, *cOptSkill3, *cOptSkill4, *cOptSkill5;

    /*
      extracting the substring in a record
    */
    cCode = strndup(insbuffer, 5);
    cReqSkill1 = strndup(insbuffer + 5, 15);
    cReqSkill2 = strndup(insbuffer + 20, 15);
    cReqSkill3 = strndup(insbuffer + 35, 15);
    cOptSkill1 = strndup(insbuffer + 50, 15);
    cOptSkill2 = strndup(insbuffer + 65, 15);
    cOptSkill3 = strndup(insbuffer + 80, 15);
    cOptSkill4 = strndup(insbuffer + 95, 15);
    cOptSkill5 = strndup(insbuffer + 110, 15);
    fprintf(fout, "%s", cCode);
    //printf("%s\n", cCode);
    fseek(fcan, 0, SEEK_SET);
    while(fgets(canbuffer, sizeof(canbuffer), fcan) != NULL){
      /*
        Setting up the variable of each course parsed
      */
      char *SID, *skill1, *skill2, *skill3, *skill4, *skill5, *skill6, *skill7, *skill8, *firstPref, *secondPref, *thirdPref;

      /*
        extracting the substring in a record
      */
      SID = strndup(canbuffer, 11);
      skill1 = strndup(canbuffer + 11, 15);
      skill2 = strndup(canbuffer + 26, 15);
      skill3 = strndup(canbuffer + 41, 15);
      skill4 = strndup(canbuffer + 56, 15);
      skill5 = strndup(canbuffer + 71, 15);
      skill6 = strndup(canbuffer + 86, 15);
      skill7 = strndup(canbuffer + 101, 15);
      skill8 = strndup(canbuffer + 116, 15);
      firstPref = strndup(canbuffer + 131, 5);
      secondPref = strndup(canbuffer + 136, 5);
      thirdPref = strndup(canbuffer + 141, 5);
      //printf("%s\n", canbuffer);

      /*
        Start the selection process
      */

      float score = 0;
      bool reqSkill1 = false, reqSkill2 = false, reqSkill3 = false;

      /*
        Check if the required skills are fulfilled
      */
      if(!strcmp(cReqSkill1, skill1) || !strcmp(cReqSkill1, skill2) || !strcmp(cReqSkill1, skill3) || !strcmp(cReqSkill1, skill4) ||
      !strcmp(cReqSkill1, skill5) || !strcmp(cReqSkill1, skill6) || !strcmp(cReqSkill1, skill7) || !strcmp(cReqSkill1, skill8)){
        reqSkill1 = true;
      }
      if(!strcmp(cReqSkill2, skill1) || !strcmp(cReqSkill2, skill2) || !strcmp(cReqSkill2, skill3) || !strcmp(cReqSkill2, skill4) ||
      !strcmp(cReqSkill2, skill5) || !strcmp(cReqSkill2, skill6) || !strcmp(cReqSkill2, skill7) || !strcmp(cReqSkill2, skill8)){
        reqSkill2 = true;
      }
      if(!strcmp(cReqSkill3, skill1) || !strcmp(cReqSkill3, skill2) || !strcmp(cReqSkill3, skill3) || !strcmp(cReqSkill3, skill4) ||
      !strcmp(cReqSkill3, skill5) || !strcmp(cReqSkill3, skill6) || !strcmp(cReqSkill3, skill7) || !strcmp(cReqSkill3, skill8)){
        reqSkill3 = true;
      }

      /*
        add the points for optional skills if all required skills are met
      */
      if(reqSkill1 && reqSkill2 && reqSkill3){
        score++;
        if(!strcmp(cOptSkill1, skill1) || !strcmp(cOptSkill1, skill2) || !strcmp(cOptSkill1, skill3) || !strcmp(cOptSkill1, skill4) ||
        !strcmp(cOptSkill1, skill5) || !strcmp(cOptSkill1, skill6) || !strcmp(cOptSkill1, skill7) || !strcmp(cOptSkill1, skill8)){
          score++;
        }
        if(!strcmp(cOptSkill2, skill1) || !strcmp(cOptSkill2, skill2) || !strcmp(cOptSkill2, skill3) || !strcmp(cOptSkill2, skill4) ||
        !strcmp(cOptSkill2, skill5) || !strcmp(cOptSkill2, skill6) || !strcmp(cOptSkill2, skill7) || !strcmp(cOptSkill2, skill8)){
          score++;
        }
        if(!strcmp(cOptSkill3, skill1) || !strcmp(cOptSkill3, skill2) || !strcmp(cOptSkill3, skill3) || !strcmp(cOptSkill3, skill4) ||
        !strcmp(cOptSkill3, skill5) || !strcmp(cOptSkill3, skill6) || !strcmp(cOptSkill3, skill7) || !strcmp(cOptSkill3, skill8)){
          score++;
        }
        if(!strcmp(cOptSkill4, skill1) || !strcmp(cOptSkill4, skill2) || !strcmp(cOptSkill4, skill3) || !strcmp(cOptSkill4, skill4) ||
        !strcmp(cOptSkill4, skill5) || !strcmp(cOptSkill4, skill6) || !strcmp(cOptSkill4, skill7) || !strcmp(cOptSkill4, skill8)){
          score++;
        }
        if(!strcmp(cOptSkill5, skill1) || !strcmp(cOptSkill5, skill2) || !strcmp(cOptSkill5, skill3) || !strcmp(cOptSkill5, skill4) ||
        !strcmp(cOptSkill5, skill5) || !strcmp(cOptSkill5, skill6) || !strcmp(cOptSkill5, skill7) || !strcmp(cOptSkill5, skill8)){
          score++;
        }

        /*
          add the preference score
        */
        if(!strcmp(cCode, firstPref)){
          score += 1.5;
        }
        if(!strcmp(cCode, secondPref)){
          score += 1;
        }
        if(!strcmp(cCode, thirdPref)){
          score += 0.5;
        }
        //fprintf(fout, "%s", SID);
        //printf("%.0f Scores:%.1f \n", atof(SID), score);

        /*
          arrange the ranking of ta
        */
        /*
          sitiation: score of the ta >= to currently rank 1 ta
        */
        if(score > ta_score[0]){
          strcpy(thirdPlace, secondPlace);
          ta_score[2] = ta_score[1];
          strcpy(secondPlace, firstPlace);
          ta_score[1] = ta_score[0];
          strcpy(firstPlace, SID);
          ta_score[0] = score;
          continue;
        }

        if(score == ta_score[0]){
          if(strcmp(SID, firstPlace) < 0){
            strcpy(thirdPlace, secondPlace);
            ta_score[2] = ta_score[1];
            strcpy(secondPlace, firstPlace);
            ta_score[1] = ta_score[0];
            strcpy(firstPlace, SID);
            ta_score[0] = score;
            continue;
          }else{
            if(score > ta_score[1]){
              strcpy(thirdPlace, secondPlace);
              ta_score[2] = ta_score[1];
              strcpy(secondPlace, SID);
              ta_score[1] = score;
              continue;
            }
            if(score == ta_score[1]){
              if(strcmp(SID, secondPlace) < 0){
                strcpy(thirdPlace, secondPlace);
                ta_score[2] = ta_score[1];
                strcpy(secondPlace, SID);
                ta_score[1] = score;
                continue;
              }else{
                if(score > ta_score[3]){
                  strcpy(thirdPlace, SID);
                  ta_score[2] = score;
                  continue;
                }
                if(strcmp(SID, thirdPlace) < 0){
                  strcpy(thirdPlace, SID);
                  ta_score[2] = score;
                  continue;
                }
              }
              
            }
          }
        }

        /*
          sitiation: score of the ta >= to currently rank 2 ta
        */
        if(score > ta_score[1]){
          strcpy(thirdPlace, secondPlace);
          ta_score[2] = ta_score[1];
          strcpy(secondPlace, SID);
          ta_score[1] = score;
          continue;
        }
        if(score == ta_score[1]){
          if(strcmp(SID, secondPlace) < 0){
            strcpy(thirdPlace, secondPlace);
            ta_score[2] = ta_score[1];
            strcpy(secondPlace, SID);
            ta_score[1] = score;
            continue;
          }else{
            if(score > ta_score[3]){
              strcpy(thirdPlace, SID);
              ta_score[2] = score;
              continue;
            }
            if(strcmp(SID, thirdPlace) < 0){
              strcpy(thirdPlace, SID);
              ta_score[2] = score;
              continue;
            }
          }
          
        }

        /*
          sitiation: score of the ta >= to currently rank 3 ta
        */
        if(score > ta_score[2]){
          strcpy(thirdPlace, SID);
          ta_score[2] = score;
          continue;
          }
        if(strcmp(SID, thirdPlace) < 0){
          strcpy(thirdPlace, SID);
          ta_score[2] = score;
          continue;
        }
      }
    }
    //printf("\t %s%s%s\n", firstPlace, secondPlace, thirdPlace);
    //printf("\n");
    fprintf(fout, "%s%s%s\n", firstPlace, secondPlace, thirdPlace);
  }
}
