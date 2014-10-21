PROGRAM life(INPUT,OUTPUT);
USES
    crt;
CONST
    xsize=75;
    ysize=21;
    alive=TRUE;
    dead=FALSE;
TYPE
    counter=PACKED ARRAY[1..xsize,1..ysize] OF BOOLEAN;
VAR
    cell:counter;
    generation:INTEGER;
    births:INTEGER;
    deaths:INTEGER;
    continue:CHAR;

{*************************************************************

                        THE GAME OF LIFE

      NAME : BRYAN DUGGAN                 CLASS : WMT1

      LANGUAGE : TURBO PASCAL             VERSION : 4

      PROGRAME : LIFE                     VERSION : 2.27




                Concept (c) 1970 New Scientist

               This Version (c) 1991 Bryan Duggan

                     All Rights Reserved


**************************************************************}

{***           Procedure to home the curser                ***}

PROCEDURE home;
BEGIN
    GOTOXY(1,1);
END;

{***     Procedure to write a given number of blank lines  ***}

PROCEDURE blank(lines:INTEGER);
VAR
    loop:INTEGER;
BEGIN
    FOR loop:=1 TO lines DO
    BEGIN
        WRITELN;
    END;
END;


{***          Procedure to initialise all cells to false          ***}

PROCEDURE kill(xsize,ysize:INTEGER;VAR cell:counter);
VAR
   loop1,loop2:INTEGER;
BEGIN
    FOR loop1:=1 TO ysize DO
    BEGIN
        FOR loop2:=1 TO xsize DO
        BEGIN
            cell[loop2,loop1]:=dead;
        END;
    END;
END;

{***   This procedure asks the user to input live cells at the
       start of the game.                                       ***}

PROCEDURE askuser(xsize,ysize:INTEGER;
                  VAR cell:counter);
VAR
    howmany:INTEGER;
    loop:INTEGER;
    xcell,ycell:INTEGER;
BEGIN
    clrscr;
    loop:=0;
    WRITELN('How many additional live cells to start ?');
    READ(howmany);
    CLRSCR;
    WHILE loop<howmany DO
    BEGIN
        loop:=loop+1;
        WRITELN('Input x and y ',loop:2,')...');
        READLN(xcell,ycell);
        WRITELN;
        WHILE (xcell>xsize) OR (xcell<1) OR (ycell>ysize) OR (ycell<1) DO
        BEGIN
            WRITELN('X must be between 1 and xsize and Y must be');
            WRITELN('between 1 and ysize. Please retry...');
            WRITELN;
            READLN(xcell,ycell);
            WRITELN;
        END;
        cell[xcell,ycell]:=alive;
    END;
END;

{***               Procedure random initialisation            ***}

PROCEDURE ran(xsize,ysize:INTEGER;
              VAR cell:counter);
VAR
    loop:INTEGER;
    xloc,yloc:INTEGER;
    howmany:INTEGER;
BEGIN
    RANDOMIZE;
    CLRSCR;
    loop:=0;
    WRITELN('How many random live cells to start ?');
    READ(howmany);
    CLRSCR;
    FOR loop:=1 TO howmany DO
    BEGIN
        xloc:=RANDOM(xsize-1)+1;
        yloc:=RANDOM(ysize-1)+1;
        cell[xloc,yloc]:=alive;
    END;
END;

{***                          PRESET   1                      ***}

PROCEDURE preset1(xsize,ysize:INTEGER;
                 VAR cell:counter);
VAR
   loop:INTEGER;

BEGIN
    FOR loop:=10 TO 60 DO
    BEGIN
        cell[loop,10]:=alive
    END;
END;

{***                          PRESET   2                     ***}

PROCEDURE preset2(xsize,ysize:INTEGER;
                 VAR cell:counter);
VAR
   x,y:INTEGER;

BEGIN
    FOR x:=10 TO 60 DO
    BEGIN
        cell[x,10]:=alive
    END;
    FOR y:=5 TO 15 DO
    BEGIN
         cell[35,y]:=alive
    END;
    cell[35,10]:=dead;
END;

{***                          PRESET   3                     ***}

PROCEDURE preset3(xsize,ysize:INTEGER;
                 VAR cell:counter);
VAR
   x,y:INTEGER;

BEGIN
    FOR x:=10 TO 60 DO
    BEGIN
        cell[x,4]:=alive;
        cell[x,16]:=alive;
        y:=y+1;
    END;
END;

{***                    Preset 4                              ***}

PROCEDURE preset4(xsize,ysize:INTEGER;
                  VAR cell:counter);
VAR
   x:INTEGER;
   y:REAL;
BEGIN
    Y:=1;
    FOR x:=60 DOWNTO 10 DO
    BEGIN
        cell[x,10]:=alive;
        cell[x,TRUNC(10+y)]:=alive;
        cell[x,TRUNC(10-y)]:=alive;
        y:=y+0.1;
    END;
END;

{***          Procedure to choose initialisation method       ***}

PROCEDURE initialise(xsize,ysize:INTEGER;
                     VAR cell:counter;
                     VAR generation:INTEGER);
VAR
    loop1,loop2:INTEGER;
    option:char;
BEGIN
    kill(xsize,ysize,cell);
    deaths:=0;
    births:=0;
    generation:=1;
    CLRSCR;
    WRITELN('                     Welcome to the game of LIFE');
    blank(4);
    WRITELN('    Choose option   1 : Random Initialisation');
    blank(2);
    WRITELN('                    2 : User Entered Starting Values');
    blank(2);
    WRITELN('                    3 : Horizontal line Preset');
    blank(2);
    WRITELN('                    4 : Cross Preset ');
    blank(2);
    WRITELN('                    5 : Double line Preset');
    blank(2);
    WRITELN('                    6 : Arrow Preset');
    blank(3);
    REPEAT
    BEGIN
        GOTOXY(21,25);
        WRITE('OPTION   >');
        option:=READKEY;
        CASE  option of
             '1' : ran(xsize,ysize,cell);
             '2' : askuser(xsize,ysize,cell);
             '3' : preset1(xsize,ysize,cell);
             '4' : preset2(xsize,ysize,cell);
             '5' : preset3(xsize,ysize,cell);
             '6' : preset4(xsize,ysize,cell);
        END;
    END;
    UNTIL ((option>='1') AND (option<='6'));
END;

{***      This procedure generates the screen display    ***}

PROCEDURE display(generation,births,deaths,xsize,ysize:INTEGER;
                  VAR cell:counter);
VAR
    loop1,loop2:INTEGER;
BEGIN
    home;
    WRITELN;
    FOR loop1:=1 TO ysize DO
    BEGIN
        FOR loop2:=1 TO xsize DO
        BEGIN
            IF cell[loop2,loop1]=alive THEN
                WRITE(chr(9))
                ELSE
                WRITE(' ');
        END;
        WRITELN;
    END;
    GOTOXY(2,22);
    WRITE('Generation  :',generation:2,'  Births :',births:2);
    WRITE('  Deaths :',deaths:2,' ANY KEY TO END SIMULATION   ');
END;

{***    Function to calculate the no of neighbours bordering
        a cell.                                              ***}

FUNCTION neighbours(xcell,ycell:INTEGER;VAR cell:counter):INTEGER;
VAR
    liveneighbours:INTEGER;
BEGIN
    liveneighbours:=0;

    IF ((ycell-1)>=1) THEN
        IF cell[XCELL,YCELL-1]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((ycell-1)>=1) AND ((xcell-1)>=1) THEN
       IF cell[xcell-1,ycell-1]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((xcell-1)>=1) THEN
       IF cell[xcell-1,ycell]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((xcell-1)>=1) AND ((ycell+1)<=ysize) THEN
       IF cell[xcell-1,ycell+1]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((ycell+1)<=ysize) THEN
       IF cell[xcell,ycell+1]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((xcell+1)<=xsize) and ((ycell+1)<=ysize) THEN
       IF cell[xcell+1,ycell+1]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((xcell+1)<=xsize) THEN
       IF cell[xcell+1,ycell]=alive THEN
            liveneighbours:=liveneighbours+1;

    IF ((xcell+1)<=xsize) AND ((ycell-1)>=1) THEN
       IF cell[xcell+1,ycell-1]=alive THEN
            liveneighbours:=liveneighbours+1;

    neighbours:=liveneighbours;
END;

{***    This procedure updates the grid. It calls the previous
        procedure to calculate the number of neighbours adjacent
        to each cell                                             ***}

PROCEDURE update(xsize,ysize:INTEGER;
                 VAR generation,births,deaths:INTEGER;
                 VAR cell:counter);
VAR
    loop1,loop2:INTEGER;
    total:INTEGER;
    updatedcell:counter;
BEGIN
    births:=0;
    deaths:=0;
    generation:=generation+1;
    FOR loop1:=1 to ysize DO
    BEGIN
        FOR loop2:=1 to xsize DO
        BEGIN
            total:=neighbours(loop2,loop1,cell);
            CASE cell[loop2,loop1] OF
               alive:
                   BEGIN
                       IF (total<=1) THEN
                           begin
                           updatedcell[loop2,loop1]:=dead;
                           {lonelyness};
                           deaths:=deaths+1
                           end;
                       IF (total>=4) THEN
                           begin
                           updatedcell[loop2,loop1]:=dead;
                           {overcrowding};
                           deaths:=deaths+1;
                           end;
                       IF total=2 THEN
                           BEGIN
                           updatedcell[loop2,loop1]:=alive;
                           {Survival}
                           END;
                   END;
               dead:
                   BEGIN
                       IF total=3 THEN
                           begin
                           updatedcell[loop2,loop1]:=alive;
                           {new birth};
                           births:=births+1;
                           end
                                  ELSE
                           updatedcell[loop2,loop1]:=dead;
                           {no change}
                   END;
             END;
         END;
    END;
    FOR loop1:=1 TO ysize DO
    BEGIN
        FOR loop2:=1 TO xsize DO
        BEGIN
            cell[loop2,loop1]:=updatedcell[loop2,loop1];
        END;
    END;
END;

{***                    MAIN LOOP                    ***}

BEGIN
 REPEAT
 BEGIN
    generation:=0;
    initialise(xsize,ysize,cell,generation);
    CLRSCR;
    REPEAT
        BEGIN
        display(generation,births,deaths,xsize,ysize,cell);
        update(xsize,ysize,generation,births,deaths,cell);
        END;
        UNTIL ((births=0) and (deaths=0)) or KEYPRESSED;
    GOTOXY(2,22);
    CLREOL;
    WRITE('                            CONTINUE (Y/N)?');
    CONTINUE:=READKEY;
    CONTINUE:=READKEY;
 END;
 UNTIL (continue='n') or (continue='N');
END.
