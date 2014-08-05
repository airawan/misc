#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define assert(x, y)	if(!(x)) { fprintf(stderr, "assertion failure: %s\n", (y)); exit(1); }

#define NUM_OF_FILES	8
#define NUM_PER_FILE	100
#define MAX_ENTRIES 	NUM_OF_FILES*NUM_PER_FILE
char *filelist[NUM_OF_FILES] = {
"scores.raw",
"scores.raw-2008-05-30",
                                //"scores.raw.070709",
"scores.raw.2005-06-05",
"scores.raw.2005-09-21",
"scores.raw.2006-04-17",
                                //"scores.raw.2007-11-13",
"scores.raw.2007-11-30",
"scores.raw.bak",
                                //"scores.raw.bak.2007-06-22",
                                //"scores.raw.bak2",
"scores.raw.bak3",
                                //"scores.raw.fun",
                                //"scores.raw.god",
"scores.raw_2006-12-23",
                                //"scores.raw_2006-12-23b",
};
#if 0 
"scores.raw",
                                //"scores.raw.070709",
"scores.raw.2005-06-05",
"scores.raw.2005-09-21",
"scores.raw.2006-04-17",
                                //"scores.raw.2007-11-13",
"scores.raw.2007-11-30",
"scores.raw.bak",
                                //"scores.raw.bak.2007-06-22",
                                //"scores.raw.bak2",
"scores.raw.bak3",
                                //"scores.raw.fun",
                                //"scores.raw.god",
"scores.raw_2006-12-23",
                                //"scores.raw_2006-12-23b",
#endif
struct high_score { 
  char what[8];
  char pts[11];
  char gold[11];
  char turns[11];
  char day[10];
  char who[16];
  char sex[2];
  char p_r[3];
  char p_c[3];
  char cur_lev[4];
  char cur_dun[4];
  char max_lev[4];
  char max_dun[4];
  char how[50];
  char mode[1];
} hs;

typedef struct _high_score {
  char *who;
  unsigned pts:31;
  unsigned valid:1;
  int max_lev;
} _high_score;

_high_score chs[MAX_ENTRIES]; 

int chs_comp (_high_score *tmp_1, _high_score *tmp_2) { 
  if (tmp_1->pts > tmp_2->pts) return -1;
  else if (tmp_1->pts == tmp_2->pts) return 0;
  return 1;
} 

int main(int argc, char **argv) { 
  FILE *fd = NULL;
  int i, j, k, progress;
  j = 0;
  for (progress = 0; progress < NUM_OF_FILES; progress++) {
    fd = fopen(filelist[progress], "r");
    assert(fd, "fopen");
printf("current file: %s\n", filelist[progress]);
    for (i = 0; i < NUM_PER_FILE; i++) {
      //they may not be filled yet
      //assert(fread(&hs, sizeof(struct high_score), 1, fd), "fread"); 
      fread(&hs, sizeof(struct high_score), 1, fd);
      chs[j].pts = atoi(hs.pts);
      chs[j].max_lev = atoi(hs.max_lev);
      assert(chs[j].who = (char*)malloc(strlen(hs.who)+1), "malloc");
      sprintf(chs[j].who, "%s", hs.who); 
      chs[j].valid = 1;
      j++;
      assert((j < MAX_ENTRIES+1), "MAX_ENTRIES REACHED (and exceeded!)");
    }
  } 
  qsort(chs, MAX_ENTRIES, sizeof(_high_score), chs_comp);
  k = 1;
  for (i = 0; i < MAX_ENTRIES; i++) {
    if (chs[i].valid == 0) continue;
    printf("#%4d  |  Score: %12u  |  Name: %15s(%2d)\n", k++, chs[i].pts, chs[i].who, chs[i].max_lev); 
  }
} 
