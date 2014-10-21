OOP Programming Labs
====================

Lab 6
-----
Use the implementation of the Game of Life we wrote in the class yesterday as a starting point for this lab. It has a bug that means the simultaion will not evolve as it should. To figure out the bug, work out what should happen to the following cells:

![Sketch](p9.png)

If you figure out the bug and fix it, you can test your game of life by making make this shape:

![Sketch](p7.png)

It should evolve for hundreds of generations, spawning creatures and consuming itself over and over again. Here is a youtube video of my version in Processing:

[![YouTube](http://img.youtube.com/vi/z4NAyrGJC5s/0.jpg)](http://www.youtube.com/watch?v=z4NAyrGJC5s)

You can check for key presses in your Processing sketches in several ways. One of them is given below:

~~~Java
if (keyPressed)
{
  // Check to see if the q key was pressed
  if (key == 'q')
  {
    println("Q");
  }
  ...
  ...
~~~

Using this method see if you can implement the following features:
- The ability to slow down and speed up your Game of Life. You can use the fact that the ```draw``` method is called 60 times a second to achieve this. You could also make use of the ```frameCount``` variable in Processing. Look it up if you are not sure what it does
- The ability to pause and unpause the sketch if you press the SPACE key.
- The ability to clear the board or randomise the board
- The ability to draw cells onto the board with the mouse. You can use the ```mousePressed``` method and the ```mouseX``` and ```mouseY``` variables in Processing to achieve this.
- The ability to spawn creatures if you press the number keys. You can see the types of creatures you could spawn in the [Wikipedia article about the Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life).

Lab 5
-----
In this lab, you will be taking the sketch and the data we worked on in the class yesterday and creating a sketch that generates this bar chart of monthly Android and IOS music searches:

![Sketch](p6.png)

Note that Android searches are plotted in blue and IOS searches are plotted in red. The dataset that we used gives the number of queries by day so the first thing we need to do is get the total number of queries each month. Here is what I suggest you do (but fee free to ignore this and come up with your own solution):

- Create a new global array called ```daysInMonth``` that holds the number of days in each month. Use constant initialisation to set the values in this array. For example:

	```Java
	/// Create an array with 4 elements initialised with values
	int[] array = {10,20,30,40};
	```

- Create arrays for ```androidByMonth``` and ```iosByMonth``` to hold the total number of android and ios queries each month. These will have 12 elements each. One element for each month.
- In the loadData method as you are reading in the data for each day from the file figure out a way to load the data into the ```androidByMonth``` and ```iosByMonth``` arrays also. You will have to use the array ```daysInMonth``` you made earlier to help you do this.
- In the draw method, figure out the maximum value of the ```iosByMonth``` array. You can use this to scale the bars so that the tallest bar fits the height of the screen. You can make a variable ```scaleFactor = (float) height / maxIos```.
- Iterate through the arrays and draw the barchart. Make the barchart fit the width of the screen. There will be 24 bars, so the width of each bar will be ```width / 24.0f```. You should use a float to store this value.
- Use rect to draw the bars. Remember the parameters are x, y, rectWidth and rectHeight. You can specify a negative number for rectHeight to get the bar to draw upwards.

### Bonus!
- Draw a pie chart of Android vs IOS queries.

Lab 4
-----
For this lab you will be making a sketch that allows the user to convert between binary and decimal using a graphical tool that looks like this:

![Sketch](p5.png)

The user should be able to click any one of the squares to "toggle" a bit on or off. The number in decimal should automatically change. For example, in the screenshot above, bits 0, 2 and 4 are turned on so the number is 1 + 4 + 16 = 21. 

To complete the sketch you can use a boolean array. Remember arrays from first year? Arrays are a  collection of data all of the same type. Read  [this article that explians how arrays work in Processing](http://www.processing.org/reference/Array.html). A boolean array is just an array where every element is either trur or false.

Here is a skeleton sketch to get you started if you need it, but *feel free to ignore this and just come up with your own solution*:

~~~Java
boolean[] bytes = new boolean[16];
int centX, centY;

// Probably need to declare some more variables here


void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;  
  
<<<<<<< HEAD
  // And set their values here
=======
  // And set their valuse here
>>>>>>> binaryNums
}


void draw()
{
  background(127);
  // Do some stuff here
  
  int number = binaryToDecimal(bytes);
  // This is how you print text in Processing
  fill(255);
  text(number, centX, 100);
}

int binaryToDecimal(boolean[] bytes)
{
  int ret = 0;
  
<<<<<<< HEAD
  // Implement this method
=======
  // Implement this function
>>>>>>> binaryNums
  
  return ret;
}

void mousePressed()
{
  // Put some code here too
  // To toggle the bit on or off based on the mouse position.
}
~~~

What I suggest you do is:

- Implement the method ```int binaryToDecimal(boolean[] bytes)```. 
- Set some of the bits in the bits array to be true and test the method you wrote by printing out the value.
- Write code in the ```draw()``` method to draw boxes to represent the bits. The box should be black only if the appropriate bit is true.
- Write code in the ```mousePressed()``` method to calculate which if any box the user has pressed the mouse onto and toggle the appropriate bit.

### Bonus!
- Print the bit numbers over the boxes
- Implement 2's complement.
- Colours! Lights! Animations!

Lab 3
-----
Check out the example Spiral skeches and the various examples we made in the class on Monday. Use loops to recreate some of [these geometric patterns from everyday life](https://plus.google.com/u/1/photos/102641008582291248101/albums/6064398604152239873). 

Try and choose at least one image that uses just loops and at least one image that uses some trigonometry. Upload your examples through webcourses. I will award a prize for the most beautiful geometric patternms in Friday's tutorial class.

Lab 2
-----
### Part 1

Make a rollover button in Processing. The button should be centred on the window and take up 30% of the width and height of the window. When you roll the mouse over the button, it should change colour from grey to blue:
Advanced! Make the button into a toggle (click on/click off) button. The button should go red when it is toggled on. In order to do this, you need to make use of the following method in your sketch:

~~~Java
void mousePressed()
~~~

This method will get called by the Processing framework whenever the mouse in pressed in the window where your sketch is running. Here is a youtube video with the completed sketch:

<a href="http://www.youtube.com/watch?feature=player_embedded&v=YGlGRnQoDFY
" target="_blank"><img src="http://img.youtube.com/vi/YGlGRnQoDFY/0.jpg" 
alt="" width="240" height="180" border="10" /></a>

### Part 2
Implement a bouncing ball. It should move diagonally in your sketch and "bounce" off the walls.

Lab 1
-----

Take the time to look up the following methods in the [Processing language reference](http://processing.org/reference/ ) to make sure you are clear about the syntax and parameters:

* line
* ellipse
* rect
* background
* stroke
* fill
* size

The first thing you need to do is complete the processing sketch we were working on in the class. Here are two shapes you can draw:

![Sketch](p1.png)

Try experimenting with colours!

Now try and figure out how to procedurally draw these patterns:

![Sketch](p2.png)

(Use variables as much as possible and use a loop in your solution)

Now try this one:

![Sketch](p3.png)

Finally try this one:

![Sketch](p4.png)

Notice the mouths

Feel free to experiment with colour!  
