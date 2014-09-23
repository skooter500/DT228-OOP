int i;
int j;
i = 0;

i = i + 10; // i = 10
i += 10; // i = 20
j = i ++; // j = 20 ; i = 21
++ i; // i = 22

j = (i + 10);

i = 20;
j = ++ i; // j = 21 i = 21

j = j * 10; // j = 210
j *=10; // j = 2100
j /= 2; // j = 1050
j = j / 2; // j = 525
println("The value of j is " + j);
println(j + "is the value of j");

boolean b;
b = true;
b = (j == 525) || (j > 10);
b = !b;

float f;
f = 0; // Assignment to an int constant 
f = 0.0f; // Assignment to a float constant

String s;
s = "Hello world ";
s += "Bryan";

