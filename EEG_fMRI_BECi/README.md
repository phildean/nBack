# nBack for EEG-fMRI

40 Blocks; 15 Trials/block (5 Target); 4 Conditions (0-, 2-, 4-Back, Rest), Number repetitions per conditions = 10

Fixed semi-randomised order of presentation of blocks. 

Target Button is 1. To change - change target button in trial and trial_nontarget .tem files. 

Stimuli are single digit numbers: [1 2 3 4 5 6 7 8 9]

ISI = 3s, Stimulus: 500ms

Sends parallel port codes:

	0-Back Target       20 
	0-Back Non-Target   10
	2-Back Target       22
	2-Back Non-Target   12
	4-Back Target       24
	4-Back Non-Target   14
	Begin Block 0-Back  51
	Begin Block 2-Back  53
	Begin Block 4-Back  54
	End Block 0-Back    60
	End Block 2-Back    63
	End Block 4-Back    64
	Begin Block Rest    50
	End Block Rest      61


Used in: Brain Effects of Creatine (BECi) study
