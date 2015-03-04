package ie.dit;

import processing.core.PApplet;
import ddf.minim.AudioInput;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;

public class TuneMatcher3 extends PApplet {
	
	Minim minim;
	AudioInput in;
	
	FFT fft;
	
	float sampleRate = 44100;
	float frameSize = 2048;
	
	float[] frequencies = {293.66f, 329.63f, 369.99f, 392.00f, 440.00f, 493.88f, 554.37f, 587.33f
            , 659.25f, 739.99f, 783.99f, 880.00f, 987.77f, 1108.73f, 1174.66f};
    String[] spellings = {"D", "E", "F", "G", "A", "B", "C", "D", "E", "F", "G", "A", "B","C", "D", "E", "F", "G", "A", "B", "C", "D", "E", "F", "G", "A", "B", "C", "D"};
	
    
    
	public void setup()
	{
		size(2048, 500);
		
		minim = new Minim(this);
		in = minim.getLineIn(Minim.MONO, (int)frameSize, sampleRate, 16);
		
		fft = new FFT((int)frameSize, (int)sampleRate);
		
	}
	
	public String spell(float frequency)
	{
		float minDist = Float.MAX_VALUE;
		int minIndex = -1;
		
		for (int i = 0 ; i < frequencies.length ; ++ i)
		{
			float distance = Math.abs(frequency - frequencies[i]);
			if (distance < minDist)
			{
				minDist = distance;
				minIndex = i;
			}
		}
		
		return spellings[minIndex];
	}
	
	public int countZeroCrossings()
	{
		int count = 0;
		for (int i = 1 ; i < in.bufferSize() ; ++ i)
		{
			if (in.left.get(i-1) > 0 && in.left.get(i) <= 0)
			{
				++ count;
			}
		}
		return count;
	}
	public void draw()
	{
		background(0);
		stroke(255);
		float average = 0;
		for (int i = 0 ; i < in.bufferSize() ; i ++)
		{
			float halfH = height / 2;
			float signal = in.left.get(i) * 100;
			line(i, halfH, i, halfH - signal);
			average += abs(in.left.get(i));
		}
		average /= in.bufferSize();
		text(average, 10, 40);
		if (average > 0.05)
		{		
			float f = countZeroCrossings();
			float frequency = (sampleRate / frameSize) * f;
			text("Frequency: " + frequency, 10, 10);
			text("Spelling: " + spell(frequency), 10, 20);			
		}	
		
		fft.forward(in.left);
		
		stroke(0, 255, 0);
		float maxPower = Float.MIN_VALUE;
		int maxIndex = -1;
		for (int i = 0 ; i < fft.specSize() ; i ++)
		{
			float power = fft.getBand(i) * 50;
			if (fft.getBand(i) > maxPower)
			{
				maxPower = fft.getBand(i);
				maxIndex = i;
			}
			line(i, height, i, height - power);
		}
		float f = fft.indexToFreq(maxIndex);
		text("Frequency by FFT: " + f, 10, 50);
		
		
	}
}
