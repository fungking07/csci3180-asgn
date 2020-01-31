000000*/*
000000* * CSCI3180 Principles of Programming Languages
000000* *
000000* * --- Declaration ---
000000* *
000000* * I declare that the assignment here submitted is original except for source
000000* * material explicitly acknowledged. I also acknowledge that I am aware of
000000* * University policy and regulations on honesty in academic work, and of the
000000* * disciplinary guidelines and procedures applicable to breaches of such policy
000000* * and regulations, as contained in the website
000000* * http://www.cuhk.edu.hk/policy/academichonesty/
000000* *
000000* * Assignment 1
000000* * Name : Lam King Fung
000000* * Student ID : 1155108968
000000* * Email Addr : kflam8@cse.cuhk.edu.hk
000000* */
000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID.   TA_RANKING.
000030 AUTHOR        LAM KING FUNG.
000040 
000050 ENVIRONMENT DIVISION.
000060 INPUT-OUTPUT SECTION.
000070 FILE CONTROL.
000080     SELECT CANDIDATES ASSIGN TO 'candidates.txt'
000081       ORGANIZATION IS LINE SEQUENTIAL
000082       FILE STATUS IS CAN-FS.
000090     SELECT INSTRUCTORS ASSIGN TO 'instrustors.txt'
000091       ORGANIZATION IS LINE SEQUENTIAL
000092       FILE STATUS IS INS-FS.
000100     SELECT OUTFILE ASSIGN TO 'output.txt'
000101       ORGANIZATION IS SEQUENTIAL
000102       FILE STATUS IS OUT-FS.