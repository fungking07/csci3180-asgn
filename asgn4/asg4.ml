(* /* 
 CSCI3180 Principles of Programming Languages 
 
 --- Declaration --- 
 
 I declare that the assignment here submitted is original except for source 
 material explicitly acknowledged. I also acknowledge that I am aware of 
 University policy and regulations on honesty in academic work, and of the 
 disciplinary guidelines and procedures applicable to breaches of such policy 
 and regulations, as contained in the website 
 http://www.cuhk.edu.hk/policy/academichonesty/ 
 
 Assignment 4 
 Name : Lam King Fung 
 Student ID : 1155108968 
 Email Addr : kflam8@cse.cuhk.edu.hk 
 */ *)

datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype hand = Nothing | Pair | Two_Pairs | Three_Of_A_Kind | Full_House | Four_Of_A_Kind | Flush | Straight;
type card = (suit * int);

(* Aux function *)
fun getRank(_, rank : int) : int = rank;
fun getSuit(suit : suit, _) : suit = suit;
fun lastEle(card : card list) : card = hd(tl(tl(tl(tl(card)))));
fun getHand(hand : hand, _) : hand = hand;
fun getValuePair(_, value : (int * int) list) : (int * int) list = value;
fun getCount(_, count : int) : int = count;
fun getValue(value : int, _) : int = value;

fun insertsort [] = [] | insertsort (x::xs) = 
        let fun insert (x:card, []) = [x] | 
        insert (x:card, y::ys) = 
        if getRank(x) >= getRank(y) then x::y::ys else 
        y::insert(x, ys) in 
        insert(x, insertsort xs) end;

fun find_pattern([(_,a : int),(_,b : int),(_,c : int),(_,d : int),(_,e : int)]) : hand * (int * int) list =

    (* 4 of a kind *)
    if a = b andalso b = c andalso c = d then (Four_Of_A_Kind,[(a,4),(e,1)])
    else if b = c andalso c = d andalso d = e then (Four_Of_A_Kind,[(b,4),(a,1)])

    (* full house *)
    else if a = b andalso b = c andalso d = e then (Full_House,[(a,3),(d,2)])
    else if a = b andalso c = d andalso d = e then (Full_House,[(c,3),(a,2)])

    (* 3 of a kind *)
    else if d <> e andalso a = b andalso b = c then (Three_Of_A_Kind,[(a,3),(d,1),(e,1)])
    else if a <> e andalso b = c andalso c = d then (Three_Of_A_Kind,[(b,3),(a,1),(e,1)])
    else if a <> b andalso c = d andalso d = e then (Three_Of_A_Kind,[(c,3),(a,1),(b,1)])

    (* 2 pairs *)
    else if a = b andalso c = d then (Two_Pairs,[(a,2),(c,2),(e,1)])
    else if a = b andalso d = e then (Two_Pairs,[(a,2),(d,2),(c,1)])
    else if b = c andalso d = e then (Two_Pairs,[(b,2),(d,2),(a,1)])

    (* Pair *)
    else if a = b then (Pair,[(a,2),(c,1),(d,1),(e,1)])
    else if b = c then (Pair,[(b,2),(a,1),(d,1),(e,1)])
    else if c = d then (Pair,[(c,2),(a,1),(b,1),(e,1)])
    else if d = e then (Pair,[(d,2),(a,1),(b,1),(c,1)])

    (* Nothing *)
    else (Nothing,[(a,1),(b,1),(c,1),(d,1),(e,1)]);

fun compare_value(cardA : (int * int) list, cardB : (int * int) list) : string = 
    if null(cardA) then "This is a tie" else 
    if getCount(hd(cardA)) > getCount(hd(cardB)) then "Hand 1 wins" else
    if getCount(hd(cardA)) < getCount(hd(cardB)) then "Hand 2 wins" else
    if getValue(hd(cardA)) > getValue(hd(cardB)) then "Hand 1 wins" else
    if getValue(hd(cardA)) < getValue(hd(cardB)) then "Hand 2 wins" else
    compare_value(tl(cardA), tl(cardB));

(* ================================================================================== *)

(* 3 - 1 : check_flush *)
fun check_flush(card : card list): bool =
    if null(tl(card)) then true else 
    if getSuit(hd(card)) = getSuit(hd(tl(card))) then check_flush(tl(card)) else false;
(*
    check_flush([(Spades, 8), (Spades, 5), (Spades, 3), (Spades, 2), (Spades, 1)]); 
    => true

    check_flush([(Hearts, 8), (Spades, 5), (Spades, 3), (Spades, 2), (Spades, 1)]);
    => false
*)

(* 3 - 2 : compare_flush *)
fun compare_flush(cardA : card list, cardB : card list) : string =
    if null(cardA) then "This is a tie" else
    if getRank(hd(cardA)) > getRank(hd(cardB)) then "Hand 1 wins" else
    if getRank(hd(cardA)) < getRank(hd(cardB)) then "Hand 2 wins" else
    compare_flush(tl(cardA), tl(cardB));
(*
    compare_flush([(Spades, 8), (Spades, 5), (Spades, 3), (Spades, 2), (Spades, 1)], 
    [(Hearts, 8), (Hearts, 5), (Hearts, 3), (Hearts, 2), (Hearts, 1)]); 
    => This is a tie

    compare_flush([(Spades, 9), (Spades, 5), (Spades, 3), (Spades, 2), (Spades, 1)], 
    [(Hearts, 8), (Hearts, 5), (Hearts, 3), (Hearts, 2), (Hearts, 1)]);
    => Hand 1 wins
    
    compare_flush([(Spades, 8), (Spades, 5), (Spades, 3), (Spades, 2), (Spades, 1)], 
    [(Hearts, 9), (Hearts, 5), (Hearts, 3), (Hearts, 2), (Hearts, 1)]);
    => Hand 2 wins
*)

(* 3 - 3 : check_straight *)
fun check_straight(card : card list) : bool = 
    if null(tl(card)) then true 
    else if getRank(hd(card)) = 13 andalso getRank(hd(tl(card))) = 12 andalso
    getRank(hd(tl(tl(card)))) = 11 andalso getRank(hd(tl(tl(tl(card))))) = 10 andalso
    getRank(lastEle(card)) = 1 then true
    else if getRank(hd(card)) - 1 = getRank(hd(tl(card))) then check_straight(tl(card))
    else false;
(*
    check_straight([(Spades, 8), (Spades, 7), (Spades, 6), (Spades, 5), (Spades, 4)]); 
    check_straight([(Spades, 13), (Spades, 12), (Spades, 11), (Spades, 10), (Spades, 1)]);
    check_straight([(Spades, 13), (Spades, 12), (Spades, 11), (Spades, 10), (Spades, 9)]);
    check_straight([(Spades, 5), (Spades, 4), (Spades, 3), (Spades, 2), (Spades, 1)]); 
    => true

    check_straight([(Hearts, 8), (Spades, 5), (Spades, 3), (Spades, 2), (Spades, 1)]);
    => false
*)

(* 3 - 4 : compare_straight *)
fun compare_straight(cardA : card list, cardB : card list) : string =
    if getRank(hd(cardA)) = 13 andalso getRank(hd(cardB)) = 13 then
        if getRank(lastEle(cardA)) < getRank(lastEle(cardB)) then "Hand 1 wins" else
        if getRank(lastEle(cardA)) > getRank(lastEle(cardB)) then "Hand 2 wins" else
        "This is a tie"
    else
    if getRank(hd(cardA)) > getRank(hd(cardB)) then "Hand 1 wins" else
    if getRank(hd(cardA)) < getRank(hd(cardB)) then "Hand 2 wins" else
    "This is a tie"
(*
    compare_straight([(Spades, 5), (Spades, 4), (Spades, 3), (Spades, 2), (Spades, 1)], 
    [(Hearts, 5), (Hearts, 4), (Hearts, 3), (Hearts, 2), (Hearts, 1)]); 
    => This is a tie

    compare_straight([(Spades, 9), (Spades, 8), (Spades, 7), (Spades, 6), (Spades, 5)], 
    [(Hearts, 8), (Hearts, 7), (Hearts, 6), (Hearts, 5), (Hearts, 4)]);
    => Hand 1 wins
    
    compare_straight([(Spades, 8), (Spades, 7), (Spades, 6), (Spades, 5), (Spades, 4)], 
    [(Hearts, 9), (Hearts, 8), (Hearts, 7), (Hearts, 6), (Hearts, 5)]);
    => Hand 2 wins
*)

(* 3 - 5 : count_pattern *)
fun count_pattern(card : card list) : hand * (int * int) list = 
    let val sorted = insertsort(card) in find_pattern(sorted) end;
(* 
    count_pattern([(Hearts, 9), (Hearts, 8), (Hearts, 7), (Hearts, 6), (Hearts, 5)]);
    => Nothing

    count_pattern([(Hearts, 9), (Hearts, 9), (Hearts, 7), (Hearts, 6), (Hearts, 5)]);
    => One_pair
*)


(* 3 - 6 : compare_count *)
fun compare_count(cardA : card list, cardB : card list) : string =
    if length(getValuePair(count_pattern(cardA))) < length(getValuePair(count_pattern(cardB))) then "Hand 1 wins"
    else if length(getValuePair(count_pattern(cardA))) > length(getValuePair(count_pattern(cardB))) then "Hand 2 wins"
    else compare_value(getValuePair(count_pattern(cardA)), getValuePair(count_pattern(cardB)));
(*
    compare_count([(Hearts, 9), (Hearts, 9), (Hearts, 7), (Hearts, 6), (Hearts, 5)],
    [(Hearts, 9), (Hearts, 8), (Hearts, 7), (Hearts, 6), (Hearts, 5)]);
    compare_count([(Hearts, 9), (Hearts, 9), (Hearts, 9), (Hearts, 6), (Hearts, 6)],
    [(Hearts, 8), (Hearts, 8), (Hearts, 8), (Hearts, 6), (Hearts, 6)]);
    => Hand 1 wins

    compare_count([(Hearts, 9), (Hearts, 8), (Hearts, 7), (Hearts, 6), (Hearts, 5)],
    [(Hearts, 9), (Hearts, 9), (Hearts, 7), (Hearts, 6), (Hearts, 5)]);
    compare_count([(Hearts, 8), (Hearts, 8), (Hearts, 8), (Hearts, 6), (Hearts, 6)],
    [(Hearts, 9), (Hearts, 9), (Hearts, 9), (Hearts, 6), (Hearts, 6)]);
    => Hand 2 wins
*)