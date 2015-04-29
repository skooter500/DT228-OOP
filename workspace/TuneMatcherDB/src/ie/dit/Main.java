package ie.dit;

import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PImage;
import ddf.minim.AudioInput;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;
import ddf.minim.analysis.WindowFunction;

public class Main extends PApplet
{
	Minim minim;
	AudioInput in;
	float min;
	float max;
	                         
	float[] frequencies = {293.66f, 329.63f, 369.99f, 392.00f, 440.00f, 493.88f, 554.37f, 587.33f
			, 659.25f, 739.99f, 783.99f, 880.00f, 987.77f, 1108.73f, 1174.66f};
	//String[] spellings = {"D,", "E,", "F,", "G,", "A,", "B,", "C", "D", "E", "F", "G", "A", "B","c", "d", "e", "f", "g", "a", "b", "c'", "d'", "e'", "f'", "g'", "a'", "b'", "c''", "d''"}; 	
	String[] spellings = {"D", "E", "F", "G", "A", "B", "C", "D", "E", "F", "G", "A", "B","C", "D", "E", "F", "G", "A", "B", "C", "D", "E", "F", "G", "A", "B", "C", "D"};
	int sampleRate = 44100;
	FFT fft;
	
	String transcription = "";
	
	TuneSearcher searcher;
		
	public void setup()
	{
		PImage image = loadImage("../halfred.png");
		size(2048, 500);
		smooth();
		minim = new Minim(this);
		
		in = minim.getLineIn(Minim.MONO, width, sampleRate, 16);
		fft = new FFT(width, sampleRate);
		min = Float.MAX_VALUE;
		max = Float.MIN_VALUE;
		
		searcher = new TuneSearcher();
		searcher.loadTunes();

		
	}
	
	public String spell(float frequency)
	{
		float minDiff = Float.MAX_VALUE;
		int minIndex = 0;
		for (int i = 0 ; i < frequencies.length; i ++)
		{
			float diff = Math.abs(frequencies[i] - frequency);
			if (diff < minDiff)
			{
				minDiff = diff;
				minIndex = i;
			}
		}
		if (minDiff  < 20)
		{
			return spellings[minIndex];
		}
		else
		{
			return "";
		}
	}
	
	public int countZeroCrossings()
	{
		int count = 0;
		
		for (int i = 1 ; i < in.bufferSize(); i ++)
		{
			if (in.left.get(i - 1) > 0 && in.left.get(i) <= 0)
			{
				count ++;
			}
		}		
		return count;		
	}
	
	public float FFTFreq()
	{
		float maxValue = Float.MIN_VALUE;
		int maxIndex = -1;
		for (int i = 0 ; i < fft.specSize() ; i ++)
		{
			if (fft.getBand(i) > maxValue)
			{
				maxValue = fft.getBand(i);
				maxIndex = i;
			}
					
		}
		return fft.indexToFreq(maxIndex);
	}
	
	String closestMatch;
	
	public void draw()
	{
		background(0);
		stroke(255);
		float average = 0;
		
		for (int i = 0 ; i < in.bufferSize(); i ++)
		{
			float sample = in.left.get(i);
			
			if (sample < min)
			{
				min = sample;
			}
			
			if (sample > max)
			{
				max = sample;
			}
			sample *= 100.0;
			line(i, height / 2, i,  (height / 2) + sample);
			average += Math.abs(in.left.get(i));
			//point(i, (height / 2) + sample);
		}

		
		average /= in.bufferSize();
		
		fft.window(FFT.HAMMING);
		fft.forward(in.left);
		stroke(0, 255, 255);
		for (int i = 0 ; i < fft.specSize() ; i ++)
		{
			line(i, height, i, height - fft.getBand(i)*100);
		}
		
		fill(255);
		text("Amp: " + average, 10, 10);
		int zeroC = countZeroCrossings();		
		
		if (average > 0.01f)
		{
			float freqByZeroC = ((float) sampleRate / (float)in.bufferSize()) * (float) zeroC;
			text("Zero crossings: " + zeroC, 10, 30);
			text("Freq by zero crossings: " + freqByZeroC, 10, 50);
			String zcSpell = spell(freqByZeroC);
			text("Spelling by zero crossings: " + spell(freqByZeroC), 10, 70);
			float freqByFFT = FFTFreq();
			
			String fftSpell = spell(freqByFFT);
			text("Freq by FFT: " + freqByFFT, 10, 90);
			text("Spelling by FFT: " + fftSpell, 10, 110);
			if (transcription.length() > 0)
			{
				if (! transcription.substring(transcription.length() - 1).equals(fftSpell))
				{
					transcription += fftSpell;
				}
			}
			else
			{
				transcription += fftSpell;
			}
		}
		
		if (transcription.length() > 60)
		{
			closestMatch = searcher.findTune(transcription).getTitle();
			transcription = "";
		}
		
		text("Closest Match: " + closestMatch, 10, 140);
		
		if (keyPressed && key == ' ')
		{
			transcription = "";
		}
		
		float smallRadius = 50;
		float bigRadius = (smallRadius * 2) + (average * 500);
		
		text("Transcription: " + transcription, 10, 130);
		stroke(0, 255, 0);
		fill(0, 255, 0);
		ellipse(width / 2, height / 2, bigRadius, bigRadius);
		stroke(0);
		fill(0);
		ellipse(width / 2, height / 2, smallRadius, smallRadius);	
		
	}
	

	/*
	public void draw()
	{
		background(0);
		stroke(255);
		for (int i = 0 ; i < in.bufferSize(); i ++)
		{
			float sample = in.left.get(i);
			if (sample < min)
			{
				min = sample;
			}
			
			if (sample > max)
			{
				max = sample;
			}
			sample *= 100.0;
			line(i, height / 2, i,  (height / 2) + sample);
			//point(i, (height / 2) + sample);
		}
		
		text("Max: " + max, 10, 10);
		text("Min: " + min, 10, 30);		
	}
	*/

	public static void main(String[] args)
	{
		PApplet.main(new String[] {"--present", "ie.dit.Main"});
	}
}
