scenario = "BECi_nBack_SCE_TARGET_1_15/06/14";
scenario_type = fMRI;
pulses_per_scan = 1;
#scan_period = 3000;
pulse_code = 100;
pcl_file = "BECi_nBack_PCL.pcl";
response_matching = simple_matching;
default_font_size = 48;
default_font = "Arial";
default_background_color = 0,0,0; 
default_text_color = 150,150,150;
active_buttons = 2;
button_codes = 1,2;
write_codes = true;
pulse_width = 20;
stimulus_properties = trial_code, string, number, string, is_target, string;
event_code_delimiter = ",";

begin;

#Introduction Screens
text{caption = "n-Back Task\n\nYou will be presented with a number every 3 seconds.\nYour task is to compare the number currently presented\nwith one you have seen either 2 or 4 numbers ago,\nor with one given at the beginning of the trial for 0-back\n\nWhen the number currently presented matches the one\nseen before, you are asked to press the target button,\notherwise press the non-target button."; font_size =20; } IntroScreen;
text{caption = "Rest Task\n\nRest blocks will be interspersed between\nthe n-Back blocks\n\nThey require no response\n\nPlease keep your eyes open and fixed on\nthe white cross"; font_size =20; } IntroScreen2;

#Block Descriptions
text{caption = "Rest Block\n\nPlease keep your eyes open\nand fixed on the white cross"; font_size = 20;}BeginBlock_Rest;
text{caption = "0 Back\n\nPress the target button when you see the number"; font_size = 20;}BeginBlock0_Back_First; 
text{caption = "<num>"; font_size = 30;}BeginBlock0_Back_Second;
#text{caption = "Press a button to continue"; font_size = 20;}BeginBlock0_Back_Third;
text{caption = "2 Back\n\nPress the target button when the number you see\nmatches the one presented two items previously.\nFor example:\n\n2  >  4  >  2\n\nA non-target response is required\nfor the first two numbers presented."; font_size = 20;}BeginBlock2_Back;
text{caption = "4 Back\n\nPress the target button when the number you see\nmatches the one presented four items previously.\nFor example:\n\n2  >  4  >  5  >  7  >  2\n\nA non-target response is required\nfor the first four numbers presented."; font_size = 20;}BeginBlock4_Back;

# Reminder of block type on top of numbers as experiment runs
text{caption = "Rest"; font_size = 15;}InfoRest;
text{caption = "0 Back"; font_size = 15;}Info0Back;
text{caption = "2 Back"; font_size = 15;}Info2Back;
text{caption = "4 Back"; font_size = 15;}Info4Back;

#blank screen with crosshairs
text{caption = "+"; font_size = 48; }Crosshair; 
#text{caption = "+"; font_size = 20; }Crosshair2; 

#General Text for Running Experiment
text{caption = "When you are ready to continue press a button"; font_size = 25; }Continue;  
text{caption = "Press a button to continue"; font_size = 25; }Continue2;     

text{caption = "End of Block:"; font_size = 25;}Block;               # T 60; T 61 for Rest (T50 for start of Rest Block)
text{caption = "<num>"; font_size = 25;}BlockNumber;                 # The <num> is overwritten by PCL
text{caption = "Percent correct:"; font_size = 25;}PercentText;
text{caption = "<num>"; font_size = 25;}PercentCorrect;              # The <num> is overwritten by PCL

# Rest Block

trial{
   trial_duration = 45000;
   all_responses = false;
   picture {   
            text Crosshair;
            x = 0; y = 250;
				text InfoRest;
				x = 0; y = 350;
   };
   deltat = 0;
   duration = 44975;
   code = "Rest Block";  
   
} RestBlock_Trial;

# Beginning of 0-Back Block

trial{
   trial_duration = 5000;
   all_responses = false;
   
   stimulus_event {
		picture {
			text BeginBlock0_Back_First;
			x = 0; y = 300; 
			text BeginBlock0_Back_Second;
			x = 0; y = 200;
		} prepic_0;
		deltat = 0;
		duration = 5000;
		port_code = 51; 
		code = "Intro 0 n-Back";
	} Intro0BackEvent;
   
} Block0;

# End of Rest block trial
trial{                 
   trial_duration = 3000;
     
     picture {
            text Block;  
            x = 0; y = 350; 
            text BlockNumber;
            x = 0; y = 300; 
  
     };
     deltat = 0;
     code = "EndBl Rest"; 
     port_code = 61;  
     
}EndTrial_Rest; 


#First Information Screens 
TEMPLATE "BECi_InfoScreen.tem" {
	stext          		pulse_no		scode							IntroName;             		
   IntroScreen    		1				"nBack Intro Screen"  	Intro1;  
   IntroScreen2    		3				"Rest Intro Screen"  	Intro2;
};

#Introduction Code 
TEMPLATE "BECi_IntroScreen.tem" {   
   stext          			pic			pcode			scode		            IntroEvent				IntroName;
	BeginBlock_Rest			pic_r			50				"Intro Rest"			IntroRestEvent			RestBlock;
   BeginBlock2_Back			pic_2			53				"Intro 2 n-Back"		Intro2BackEvent		Block2;
   BeginBlock4_Back			pic_4			54				"Intro 4 n-Back"		Intro4BackEvent		Block4;
};

#EndTrialScreen
TEMPLATE "BECi_EndTrialScreen.tem" {   
   scode					pcode		EndTrialName;
	"EndBl 0-Back"		60			EndTrial_0Back;
   "EndBl 2-Back"		63			EndTrial_2Back;
   "EndBl 4-Back"		64			EndTrial_4Back;
};

#The array of numbers
array {
	text { caption = "1"; description = "1"; } one;
	text { caption = "2"; description = "2"; };
	text { caption = "3"; description = "3"; };
	text { caption = "4"; description = "4"; };
	text { caption = "5"; description = "5"; };
	text { caption = "6"; description = "6"; };
	text { caption = "7"; description = "7"; };
	text { caption = "8"; description = "8"; };
	text { caption = "9"; description = "9"; };
} numbers;

#PreBlock MRI Pulse Timing
TEMPLATE "BECi_MRIPulseTiming.tem" {   
	info				scode								main_trial;						
	Info0Back		"Post MR Pulse 0-Back"		n_back_0_MRI_Pulse;
	Info2Back		"Post MR Pulse 2-Back"		n_back_2_MRI_Pulse;
	Info4Back		"Post MR Pulse 4-Back"		n_back_4_MRI_Pulse;
};

#Trial (target) codes
TEMPLATE "BECi_Trial.tem" {   
	info				pic	          			trialportcode			event             			main_trial;						
	Info0Back		n_back_0_pic_target		20							n_back_0_event_target		n_back_0_trial_target;
	Info2Back		n_back_2_pic_target		22							n_back_2_event_target		n_back_2_trial_target;
	Info4Back		n_back_4_pic_target		24							n_back_4_event_target		n_back_4_trial_target;
};

#Trial (non-target) codes
TEMPLATE "BECi_Trial_NonTarget.tem" {
	info				pic	          			trialportcode			event             			main_trial;						
	Info0Back		n_back_0_pic_normal		10							n_back_0_event_normal		n_back_0_trial_normal;
	Info2Back		n_back_2_pic_normal		12							n_back_2_event_normal		n_back_2_trial_normal;
	Info4Back		n_back_4_pic_normal		14							n_back_4_event_normal		n_back_4_trial_normal;
};