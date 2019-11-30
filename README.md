# selenium_automation
Automation of web browser using docker container with selenium + config file

Usage: 
            > docker_run_script <chrome|firefox>

This tool can be used to carry out web browser automation based on a configuration file named "selenium_config.yml"

An example configuration file has been included:

browser_steps:      
  - get_url: "https://www.w3schools.com/html/html_forms.asp"
  - sleep: 5
  - css_path: "#sncmp-banner-btn-agree"
  - click: "click"
  - sleep: 2
  - css_path: "#main > div:nth-child(5) > div > form > input[type=text]:nth-child(2)"
  - input_string: "Hello"
  - sleep: 2
  - css_path: "#main > div:nth-child(5) > div > form > input[type=text]:nth-child(5)"
  - input_string: "Gurus!"
  - sleep: 2
  - css_path: "#main > div:nth-child(5) > div > form > input[type=submit]:nth-child(8)"
  - click:  "click"

css_path can easily be obtained by inspecting any element on chrome developer tools and copying the selector.
