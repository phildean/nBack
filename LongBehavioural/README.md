# Long n-Back Behavioural (or EEG)

12 Blocks; 60 Trials/block (20 Target); 4 Conditions (0-, 1-, 2-, 3-Back)

Stimuli are single digit numbers: [1 2 3 4 5 6 7 8 9]

ISI = 3s, Stimulus: 500ms

_Single digit numbers between 1 and 9 inclusive are presented on the screen one at a time, 
with 60 of these stimuli (including 20 randomly ordered target stimuli) per block. 
There are a total of 12 blocks for each task, with 3 randomly ordered repetitions of the 4 levels of difficulty.
There are four conditions: 0-Back, 1-Back, 2-Back, and 3-Back. The numbers are presented every 3 s. 
Participants are asked to press the target button when the number on screen matched the number observed one previous (1-Back), 
two previous (2-Back), or three previous (3-Back). For every other number that did not match, participants are asked to press the non-target button. 
In the fourth condition (0-Back) a random number between 1 and 9 is designated as a target at the beginning of the block._

Can be used with EEG, and sends parallel port codes:

		0-Back Target       20 
		0-Back Non-Target   10
		1-Back Target       21
		1-Back Non-Target   11
		2-Back Target       22
		2-Back Non-Target   12
		3-Back Target       23
		3-Back Non-Target   13
		Pause               50
		End Of Block        60

Used in:
Dean PJA, Sterr AM (2013) Long-term effects of mild traumatic brain injury on cognitive performance, 
Frontiers in Human Neuroscience 7 30 pp. 1-11 Frontiers Research Foundation
