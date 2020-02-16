#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <memory.h>

typedef struct course{
  int cid;
  char reqskills[3][15];
  char optskills[5][15];
}course;

typedef struct candidate{
  int taid;
  char skills[8][15];
  int per[3];
  float score;
}candidate;

void print_course(course cse){
  printf("\n\ncid %d\n", cse.cid);
  for(int i=0;i<3;i++){
    for(int k=0;k<15;k++){
      printf("%c", cse.reqskills[i][k]);
    }
  printf("req i %d\n",i);
}
  for(int i=0;i<5;i++){
    for(int k=0;k<15;k++){
      printf("%c", cse.optskills[i][k]);
    }
  printf("opt i %d\n",i);
}
printf("\n");
}

void print_candidate(candidate cand){
  printf("taid %d\n",cand.taid);
  for(int i=0;i<8;i++){
    for(int k=0;k<15;k++){
      printf("%c", cand.skills[i][k]);
    }
    printf("skills i %d\n", i);
  }
  for(int i=0;i<3;i++){
    printf("per %d_%d\n", i,cand.per[i]);
  }
  printf("%f\n\n", cand.score);
}

course scanning_course(FILE *fp)
{
  char buf[255], tmp[255];
  memset(buf, 0, 255);
  course cse;
  fscanf(fp,"%[^\n]\n",buf);
  memset(tmp, 0, 255);
  strncpy(tmp,buf+0,4);
  sscanf(tmp,"%d",&cse.cid);
  int i=0;
  for(i;i<3;i++)
  {
    memset(cse.reqskills[i],0,255);
    strncpy(cse.reqskills[i],buf+5+i*15,15);
  }
  for(i;i<8;i++)
  {
    memset(cse.optskills[i-3],0,255);
    strncpy(cse.optskills[i-3],buf+5+i*15,15);
  }
  return cse;
}

void init_res(candidate *res)
{
  for(int i=0;i<3;i++)
  {
    res[i].taid = 0;
    res[i].score = 0.;
  }
}
candidate scanningta(FILE *fp)
{
  char buf[255], tmp[255];
  memset(buf,0,255);
  candidate ret;
  fscanf(fp,"%[^\n]\n",buf);
  strncpy(tmp,buf+0,10);
  sscanf(tmp,"%d",&ret.taid);
  for(int i=0;i<8;i++)
  {
    memset(ret.skills[i],0,255);
    strncpy(ret.skills[i],buf+1+10+i*15,15);
  }
  strncpy(tmp,buf+130,15);
  sscanf(tmp,"%d %d %d ",&ret.per[0], &ret.per[1], &ret.per[2]);
  ret.score=0.;
return ret;
}

bool select_reqskills(course cse, candidate cand)
{
  bool allreq=false;
  int count=0,flag=0;
  char str1[15],str2[15];
  for (int i=0;i<3;i++)
  {
    print_course(cse);
    print_candidate(cand);
    memcpy(str1, cse.reqskills[i], 15);
    //printf("%s\n", str1);
    for (int j=0;j<8;i++)
    {
      memcpy(str2, cand.skills[i],15);
      printf("%s\n", str2);
      if(strcmp(str1, str2)==0) count++;
    }
  }
  if(count==3){
    allreq==true;
  }
  return allreq;
}
void score_calculator(course cse, candidate cand)
{
  int flag;
  cand.score=1.;//score=1+no of skills satisfied+ prefence
  for(int i=0;i<5;i++)
  {
    for(int j=0;j<8;j++)
    {
      flag=0;
      for(int k=0;k<15;k++)
      {
        if(cse.optskills[i][k]!=cand.skills[j][k])
        {
          flag++;
          break;
        }
      }
      if (flag==0) cand.score++;
    }
  }
  //perference score
  for(int i=0;i<3;i++)
  {
    if(cand.per[i]==cse.cid){
      if(i==0) i=2;
      if(i==2) i=0;
      cand.score+=0.5*(i+1);
    }
  }
}
void check_insert(candidate tmp, candidate *res)
{
  //check
  int i=0;
  for(i;i<3;i++)
  {
    if(tmp.score==res[i].score)
    {
      if(tmp.taid>res[i].taid)
      {
        break;
      }
    }
    if(tmp.score>res[i].score) break;
  }

  //insert
  candidate tmp1,tmp2;
  tmp1=res[i];
  res[i]=tmp;
  for(i;i<3;i++)
  {
    if(i!=2){
      tmp2=res[i+1];
      res[i+1]=tmp1;
      tmp1=tmp2;
    }
  }

}

void select_ta(course cse, FILE *fta, candidate *res)
{
  fseek(fta,0,SEEK_SET);  //curser must be on the front each time, in fta
  while(!feof(fta))
  {
    candidate tmp = scanningta(fta);
    bool req_flag = select_reqskills(cse,tmp);
    if (req_flag==true){
      score_calculator(cse, tmp);
    }
    else{
      tmp.score=0;
    }
    check_insert(tmp,res);
  }
}


int main(int argc, char const *argv[])
{
  FILE *finstruct, *fta, *fout;
  candidate res[3]; //result must be 3

  if((finstruct = fopen("./instructors.txt","r"))==NULL)
  {
    printf("non-existing file!ar");
    exit(-1);
  }
  if((fta = fopen("./candidates.txt","r"))==NULL)
  {
    printf("non-existing file!");
    exit(-1);
  }
  fout = fopen("output.txt", "w+");
  while(!feof(finstruct))
  {
    course tmp = scanning_course(finstruct);
    init_res(res);
    select_ta(tmp,fta,res);
    /*
    for(int i=0;i<3;i++)
    {
      fprintf(fout, "%d\n", i);
    }
*/
  }
  fclose(finstruct);
  fclose(fta);
  fclose(fout);




  return 0;
}
