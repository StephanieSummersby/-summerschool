install.packages("remotes")
remotes::install_github("djnavarro/jaysire")
library(jaysire)

# set directory (deletes any existing old experiment builds in it)
my_directory <- file.path("starting_exp") 
# create the empty folder if necessary
if(dir.exists(my_directory)) {  
  unlink(my_directory, recursive = TRUE)
}

#get instructions
instructions <- trial_instructions(
  pages = c("Welcome! Use the arrow buttons to browse these instructions", 
            "In this experiment you will solve some equations.<br><br>It is <i>very important</i> that you do your best", 
            "Press the 'Forward' button to begin!"
            ),
            show_clickable_nav = TRUE,
            button_label_previous = "Backward",
            button_label_next = "Forward",
            post_trial_gap = 1000
) #can also use <em> for italics

trial1 <- trial_html_button_response(  
  stimulus = "13 + 23 = 36",  
  choices = c("true", "false"),  
  post_trial_gap = 500
)

trial2 <- trial_html_button_response(  
  stimulus = "2 + 2 = 5",  
  choices = c("true", "false", "I don't know"),  
  post_trial_gap = 500
)

trial3 <- trial_html_slider_response(  
  stimulus = "How likely is it that the suspect is guilty?",  
  labels = c("Not at all likely", "Neither likely or unlikely", "Very likely"),  
  button_label = "Continue", 
  min = 0, max = 100,
  start = 50, step = 1, slider_width = NULL,
  require_movement = TRUE, prompt = NULL, stimulus_duration = NULL,
  trial_duration = NULL, response_ends_trial = TRUE,
  post_trial_gap = 500, on_finish = NULL, on_load = NULL,
  data = NULL
)

#always put this section at the end
build_experiment(  
  timeline = build_timeline(instructions, trial1, trial2, trial3),  
  path = my_directory,   
  on_finish = fn_save_datastore()
)