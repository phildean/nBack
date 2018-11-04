scenario = "n-Back_19/05/09";
pcl_file = "N-Back_Main.pcl";
response_matching = simple_matching;
default_font_size = 48;
default_font = "Arial";
default_background_color = 0,0,0; 
default_text_color = 150,150,150;
active_buttons = 5;
button_codes = 1,2,3,4,5;
write_codes = true;
pulse_width = 20;
stimulus_properties = trial_code, string, number, string, is_target, string;
event_code_delimiter = ",";

begin;

#n-back Introduction Screen
text{caption = "n-Back Task\n\nYou will be presented with a number every 3 seconds.\nYour task is to compare the number currently presented\nwith one you have seen either 1, 2 or 3 numbers ago,\nor with one given at the beginning of the trial for 0-back\n\nWhen the number currently presented matches the one\nseen before, you are asked to press the target button,\notherwise press the non-target button."; font_size =20; } IntroScreen;

#n-back Block Descriptions
text{caption = "0 Back\n\nPress the target button when you see the number"; font_size = 20;}BeginBlock0_Back_First; 
text{caption = "<num>"; font_size = 30;}BeginBlock0_Back_Second;
text{caption = "Press a button to continue"; font_size = 20;}BeginBlock0_Back_Third;
text{caption = "1 Back\n\nPress the target button when the number you see\nmatches the one presented previously.\nFor example:\n\n2  >  2\n\nA non-target response is required\nfor the first number presented."; font_size = 20;}BeginBlock1_Back;
text{caption = "2 Back\n\nPress the target button when the number you see\nmatches the one presented two items previously.\nFor example:\n\n2  >  4  >  2\n\nA non-target response is required\nfor the first two numbers presented."; font_size = 20;}BeginBlock2_Back;
text{caption = "3 Back\n\nPress the target button when the number you see\nmatches the one presented three items previously.\nFor example:\n\n2  >  4  >  5  >  2\n\nA non-target response is required\nfor the first three numbers presented."; font_size = 20;}BeginBlock3_Back;

#Second start screen
text{caption = "0 Back\n\nTarget Number:"; font_size = 30;}Start0Back1;
text{caption = "<num>"; font_size = 35;}Start0Back2;
text{caption = "Press a button to start"; font_size = 30;}Start0Back3;
text{caption = "1 Back"; font_size = 30;}Start1Back;
text{caption = "2 Back"; font_size = 30;}Start2Back;
text{caption = "3 Back"; font_size = 30;}Start3Back;
text{caption = "Press a button to start"; font_size = 30;}Continue3;

# Reminder in top right corner of screen as experiment runs
text{caption = "0 Back"; font_size = 15;}Info0Back;
text{caption = "1 Back"; font_size = 15;}Info1Back;
text{caption = "2 Back"; font_size = 15;}Info2Back;
text{caption = "3 Back"; font_size = 15;}Info3Back;

#blank screen with crosshairs
text{caption = "+"; font_size = 48; }Crosshair; 
text{caption = "+"; font_size = 20; }Crosshair2; 

#General Text for Running Experiment
text{caption = "!! Please take a break !!\nExperiment has been paused by the experimenter"; font_size = 25;}Pause;    # T 50
text{caption = "!! Please take a break !!\n\nHalfway through experiment\n\nPlease wait for next trial to begin!"; font_size = 25;}Pause2;    # T 50
text{caption = "When you are ready to continue press a button"; font_size = 25; }Continue;  
text{caption = "Press a button to continue"; font_size = 25; }Continue2;     

text{caption = "End of Block:"; font_size = 25;}Block;               # T 60
text{caption = "<num>"; font_size = 25;}BlockNumber;                 # The <num> is overwritten by PCL
text{caption = "Percent correct:"; font_size = 25;}PercentText;
text{caption = "<num>"; font_size = 25;}PercentCorrect;              # The <num> is overwritten by PCL

# Blank Screen

trial{
   trial_duration = 20000;
   all_responses = false;
   picture {   
            text Crosshair;
            x = 0; y = 0;
   };
   deltat = 25;
   duration = 19975;

   code = "Blank Screen";  
   
} BlankScreen;

# Pre Beginning of 0-Back Block

trial{
   trial_duration = 1000;
   all_responses = false;
   
   stimulus_event {
		picture {
			text BeginBlock0_Back_First;
			x = 0; y = 150; 
			text BeginBlock0_Back_Second;
			x = 0; y = 0;
		} prepic_0;
		deltat = 25;
		duration = 1000;
		code = "Pre Intro 0 n-Back";
	} PreIntro0BackEvent;
   
} PreBlock0;


# Beginning of 0-back Block

trial{
   trial_duration = forever;
   trial_type = first_response;
   all_responses = true;
   picture {
				text BeginBlock0_Back_First;
            x = 0; y = 150;   
            text BeginBlock0_Back_Second;
            x = 0; y = 0;
            text BeginBlock0_Back_Third;
            x = 0; y = -100;
   };
   deltat = 0;
   duration = response;

   code = "Intro 0 n-Back";  
   
} Block0;

# Start of 0-Back Block

trial{
   trial_duration = forever;
   trial_type = first_response;
   all_responses = true;
   picture {
				text Start0Back1;
            x = 0; y = 150;   
            text Start0Back2;
            x = 0; y = 0;
            text Start0Back3;
            x = 0; y = -100;
   };
   deltat = 0;
   duration = response;

   code = "Start 0 n-Back";  
   
} Start_0_Back;

# Resume trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
    
     picture {
            text Continue;
            x = 0; y = 0;
      };
     code = "Cont";   
     
}ResumeTrial; 

# Pause trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
     
     picture {
            text Pause;
            x = 0; y = 0;
     };
     deltat = 25;
     code = "Pause";   
     port_code = 50;
     
}PauseTrial;

# Pause2 trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
     
     picture {
            text Pause2;
            x = 0; y = 0;
     };
     deltat = 25;
     code = "Pause2";   
     port_code = 51;
     
}Pause2Trial;


# End of block trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
     
     picture {
            text Block;  
            x = 0; y = 100; 
            text BlockNumber;
            x = 0; y = 50;   
            text PercentText;
            x = 0; y = 0;
            text PercentCorrect;
            x = 0; y = -50;
            text Continue2;
            x = 0; y = -150;
     };
     deltat = 25;
     code = "EndBl"; 
     port_code = 60;  
     
}EndTrial; 


#Pre Introduction Code 
TEMPLATE "PreIntroScreen.tem" {   
   stext          			prepic			scode		             	PreIntroEvent				IntroName;
   BeginBlock1_Back			prepic_1			"Pre Intro 1 n-Back"		PreIntro1BackEvent		PreBlock1;
   BeginBlock2_Back			prepic_2			"Pre Intro 2 n-Back"		PreIntro2BackEvent		PreBlock2;
   BeginBlock3_Back			prepic_3			"Pre Intro 3 n-Back"		PreIntro3BackEvent		PreBlock3;
};

#Introduction Code 
TEMPLATE "IntroScreen.tem" {   
   stext          		stext2				scode             		IntroName;
   IntroScreen    		Continue2			"Intro Screen"    		Intro1;
   BeginBlock1_Back		Continue2			"Intro 1 n-Back"			Block1;
   BeginBlock2_Back		Continue2			"Intro 2 n-Back"			Block2;
   BeginBlock3_Back		Continue2			"Intro 3 n-Back"			Block3;
   Start1Back				Continue3			"Start 1 n-Back"			Start_1_Back;
   Start2Back				Continue3			"Start 2 n-Back"			Start_2_Back;
   Start3Back				Continue3			"Start 3 n-Back"			Start_3_Back;
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

#Trial (target) codes
TEMPLATE "Trial.tem" {   
	info				pic	          			trialportcode			event             			main_trial;						
	Info0Back		n_back_0_pic_target		20							n_back_0_event_target		n_back_0_trial_target;
	Info1Back		n_back_1_pic_target		21							n_back_1_event_target		n_back_1_trial_target;
	Info2Back		n_back_2_pic_target		22							n_back_2_event_target		n_back_2_trial_target;
	Info3Back		n_back_3_pic_target		23							n_back_3_event_target		n_back_3_trial_target;
};

#Trial (non-target) codes
TEMPLATE "Trial_NonTarget.tem" {
	info				pic	          			trialportcode			event             			main_trial;						
	Info0Back		n_back_0_pic_normal		10							n_back_0_event_normal		n_back_0_trial_normal;
	Info1Back		n_back_1_pic_normal		11							n_back_1_event_normal		n_back_1_trial_normal;
	Info2Back		n_back_2_pic_normal		12							n_back_2_event_normal		n_back_2_trial_normal;
	Info3Back		n_back_3_pic_normal		13							n_back_3_event_normal		n_back_3_trial_normal;
};