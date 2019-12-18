library(jaysire)

# set directory (deletes any existing old experiment builds in it)
my_directory <- file.path("adv_exp")
# create the empty folder if necessary
if(dir.exists(my_directory)) {
  unlink(my_directory, recursive = TRUE)
}

# ----------- insert your stimuli here -----------

phrases <- c(  "I is working hard",   
                 "Working hard I am",   
                 "I'm working hard",   
                 "Hard working is I"
)

# ----------- instructions -----------
instructions <- trial_instructions(
  pages = c(
    "Welcome! Use the arrow buttons to browse these instructions.",
    "Your task is to decide the grammatical acceptability of some sentences.",
    "You will respond by sliding a scale to the point that best corresponds with your answer.",
    "Press the 'Next' button to begin!"
  ),
  show_clickable_nav = TRUE,
  post_trial_gap = 200
)

# ----------- insert your trial template here -----------

trial_template <- trial_html_slider_response(  
  stimulus = insert_variable(name = "my_stimulus"), labels = c("Not at all acceptable", "Definitely acceptable"),
  button_label = "Continue", min = 1, max = 7,
  start = 3.5, step = 0.5, slider_width = NULL,
  require_movement = FALSE, prompt = NULL, stimulus_duration = NULL,
  trial_duration = NULL, response_ends_trial = TRUE,
  post_trial_gap = 1000, on_finish = NULL, on_load = NULL,
  data = NULL)

# ----------- insert your timeline here -----------
trials <- build_timeline(trial_template) %>%  
  tl_add_variables(my_stimulus = phrases)%>%
  tl_add_parameters(randomize_order = TRUE)

# ----------- final trial -----------
finish <- trial_html_keyboard_response(
  stimulus = "All done! Press any key to finish",
  choices = respond_any_key()
)

# ----------- build the experiment -----------
build_experiment(
  # put your modified timeline here
  timeline = build_timeline(instructions, trials, finish),
  path = my_directory,
  on_finish = fn_save_locally()
)
