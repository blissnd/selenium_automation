import sys
import time
import yaml

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

yml_file_handle = open("./selenium_config.yml")
yml_buffer = yaml.load(yml_file_handle)

##################################################################################

browser_type = sys.argv[1]

browser = None

if browser_type == "firefox":
    
    browser = webdriver.Firefox()
else:
    chrome_options = webdriver.ChromeOptions();
    chrome_options.add_argument("--no-sandbox");
    chrome_options.add_argument("--disable-dev-shm-usage");
    browser = webdriver.Chrome(chrome_options = chrome_options)

##################################################################################

current_html_elem = None

for array_elem in yml_buffer['browser_steps']:
    for dict_key, dict_val in array_elem.items():
        
        if dict_key == "get_url":
            browser.get(dict_val)
            
        elif dict_key == "sleep":
            time.sleep(dict_val)

        elif dict_key == "css_path":
            current_html_elem = browser.find_element_by_css_selector(dict_val)
        
        elif dict_key == "input_string":
            current_html_elem.send_keys(dict_val)
        
        elif dict_key == "click":
            current_html_elem.click()

    # End For
# End For

##################################################################################

#browser.quit()
