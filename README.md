Getting Started

This is Bowling Game app to calculate Score. It is all about the calculating the total Score of Number of pins knocked down in 10 Frames.

# Prequisites

	•	MacOS Version 10.14.4 or later
	•	Xcode 10.2 with SDK 12.2 & Swift Version 5.0

# Steps To Run This Application

	•	Open BowlingGame.xcodeproj file in BowlingGame Folder using Xcode Application
	•	Select the BowlingGame target.
	•	Run the Application by selecting any iPhoneSimulator

# Problem Description

	•	Each game, or “line” of bowling, includes ten turns, or “frames” for the bowler.
	•	In each frame, the bowler gets up to two tries to knock down all the pins.
	•	If in two tries, he fails to knock them all down, his score for that frame is the total number of pins knocked down in his two tries.
	•	If in two tries he knocks them all down, this is called a “spare” and his score for the frame is ten plus the number of pins knocked down on his next throw (in his next turn).
	•	If on his first try in the frame he knocks down all the pins, this is called a “strike”. His turn is over, and his score for the frame is ten plus the simple total of the pins knocked down in his next two rolls.
	•	If he gets a spare or strike in the last (tenth) frame, the bowler gets to throw one or two more bonus balls, respectively. These bonus throws are taken as part of the same turn. If the bonus throws knock down all the pins, the process does not repeat: the bonus throws are only used to calculate the score of the final frame.
	•	The game score is the total of all frame scores.

# Additional Points Handled

	•	Scores for Intermediate frames 

# Exceptions 

	•	We will not check for valid rolls.
	•	We will not check for correct number of rolls and frames.

# Running the Test

	•	To perform both Unit Test and UI Test, press command + u to run all 

# Design Pattern used 

	•	MVP pattern is used
	•	Followed TDD approach 
	•	Added Test Cases for all business logic in Presenter
	•	Used Stack Views for designing UI in such a way that changes in UI will be handled easily.

<p align="center">
<img src="https://github.com/2019-SOW-DEV-008/BowlingGame/blob/master/BowlingGame1.png"/>
 <img src="https://github.com/2019-SOW-DEV-008/BowlingGame/blob/master/BowlingGame2.png"/>
</p>


<p align="center">
<img src="https://github.com/2019-SOW-DEV-008/BowlingGame/blob/master/BowlingGame.gif"/>
</p>
