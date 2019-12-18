var timeline = {
  "timeline": [
    {
      "type": ["instructions"],
      "pages": ["Welcome! Use the arrow buttons to browse these instructions", "In this experiment you will solve some equations.<br><br>It is <i>very important<\/i> that you do your best", "Press the 'Forward' button to begin!"],
      "key_forward": [39],
      "key_backward": [37],
      "allow_backward": true,
      "allow_keys": true,
      "show_clickable_nav": true,
      "button_label_previous": ["Backward"],
      "button_label_next": ["Forward"],
      "post_trial_gap": [1000]
    },
    {
      "type": ["html-button-response"],
      "stimulus": ["13 + 23 = 36"],
      "choices": ["true", "false"],
      "margin_vertical": ["0px"],
      "margin_horizontal": ["8px"],
      "response_ends_trial": true,
      "post_trial_gap": [500]
    },
    {
      "type": ["html-button-response"],
      "stimulus": ["2 + 2 = 5"],
      "choices": ["true", "false", "I don't know"],
      "margin_vertical": ["0px"],
      "margin_horizontal": ["8px"],
      "response_ends_trial": true,
      "post_trial_gap": [500]
    },
    {
      "type": ["html-slider-response"],
      "stimulus": ["How likely is it that the suspect is guilty?"],
      "labels": ["Not at all likely", "Neither likely or unlikely", "Very likely"],
      "button_label": ["Continue"],
      "min": [0],
      "max": [100],
      "start": [50],
      "step": [1],
      "require_movement": true,
      "response_ends_trial": true,
      "post_trial_gap": [500]
    }
  ]
};

jsPsych.init(
{
  "timeline": [timeline],
  "on_finish": function() {
      $.post('submit',{"content": jsPsych.data.get().csv()})
    }
}
);
