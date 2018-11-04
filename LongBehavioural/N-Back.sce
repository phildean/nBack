scenario = "n-Back_25/04/08";
pcl_file = "N-Back_Main.pcl";
response_matching = simple_matching;
default_font_size = 48;
default_font = "Arial";
default_background_color = 0,0,0; 
default_text_color = 255,255,255;
active_buttons = 4;
button_codes = 1,2,3,4;
write_codes = true;
pulse_width = 20;
stimulus_properties = trial_code, string, number, string, is_target, string;
event_code_delimiter = ",";

begin;

#n-back Introduction Screen
text{caption = "n-Back Task\n\nIn each trial you will be presented with a number\nevery 3 seconds. Your task is to compare the\nnumber currently presented with one you have seen\neither 1, 2 or 3 numbers ago, or with one given\nat the beginning of the trial for 0-back\n\nWhen the number currently presented matches that seen\n1, 2 or 3 numbers ago you are asked to press the target button\notherwise press the non-target button."; font_size =25; } IntroScreen;

#n-back Block Descriptions
text{caption = "0 Back\n\nIn this block you will be required to press\nthe target button when you see the number"; font_size = 25;}BeginBlock0_Back_First; 
text{caption = "<num>"; font_size = 30;}BeginBlock0_Back_Second;
text{caption = "Press a button to continue"; font_size = 25;}BeginBlock0_Back_Third;
text{caption = "1 Back\n\nIn this block you will be required to press\nthe target button when the number you see matches the\none presented previously. For example:\n\n2  -  2\n\nA non-target response is required\nfor the first number presented.\n\nPress a button to continue"; font_size = 25;}BeginBlock1_Back;
text{caption = "2 Back\n\nIn this block you will be required to press\nthe target button when the number you see matches the\none presented two items previously. For example:\n\n2  -  4  -  2\n\nA non-target response is required\nfor the first two numbers presented.\n\nPress a button to continue"; font_size = 25;}BeginBlock2_Back;
text{caption = "3 Back\n\nIn this block you will be required to press\nthe target button when the number you see matches the\none presented three items previously. For example:\n\n2  -  4  -  5  -  2\n\nA non-target response is required\nfor the first three numbers presented.\n\nPress a button to continue"; font_size = 25;}BeginBlock3_Back;

#General Text for Running Experiment
text{caption = "Please keep your eyes fixed\non the centre of the screen"; font_size = 25;}Pretrial;

text{caption = "!! Please take a break !!\nExperiment has been paused by the experimenter"; font_size = 25;}Pause;    # T 50
text{caption = "When you are ready to continue press a button"; font_size = 25; }Continue;     

text{caption = "End of Block:"; font_size = 25;}Block;               # T 60
text{caption = "<num>"; font_size = 25;}BlockNumber;                 # The <num> is overwritten by PCL
text{caption = "Percent correct:"; font_size = 25;}PercentText;
text{caption = "<num>"; font_size = 25;}PercentCorrect;              # The <num> is overwritten by PCL

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
   deltat = 25;
   duration = response;

   code = "Intro 0 n-Back";  
   
} Block0;

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
     };
     deltat = 25;
     code = "EndBl"; 
     port_code = 60;  
     
}EndTrial; 

#Introduction Code 

TEMPLATE "IntroScreen.tem" {   
   stext          		scode             		IntroName;
   IntroScreen    		"Intro Screen"    		Intro1;
   BeginBlock1_Back		"Intro 1 n-Back"			Block1;
   BeginBlock2_Back		"Intro 2 n-Back"			Block2;
   BeginBlock3_Back		"Intro 3 n-Back"			Block3;
   Pretrial       		"Pretrial"        		Intro2;
};

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


TEMPLATE "Trial.tem" {   
   pic	          			trialportcode			event             			main_trial;						
	n_back_0_pic_target		20							n_back_0_event_target		n_back_0_trial_target;
	n_back_1_pic_target		21							n_back_1_event_target		n_back_1_trial_target;
	n_back_2_pic_target		22							n_back_2_event_target		n_back_2_trial_target;
	n_back_3_pic_target		23							n_back_3_event_target		n_back_3_trial_target;
};

TEMPLATE "Trial_NonTarget.tem" {
	pic	          			trialportcode			event             			main_trial;						
	n_back_0_pic_normal		10							n_back_0_event_normal		n_back_0_trial_normal;
	n_back_1_pic_normal		11							n_back_1_event_normal		n_back_1_trial_normal;
	n_back_2_pic_normal		12							n_back_2_event_normal		n_back_2_trial_normal;
	n_back_3_pic_normal		13							n_back_3_event_normal		n_back_3_trial_normal;
};