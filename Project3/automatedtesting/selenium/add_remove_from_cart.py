from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from time import sleep
from selenium.webdriver.chrome.options import Options as ChromeOptions
from datetime import datetime
print('####################################################')
print('Start Preperation')
print(datetime.now())

options = ChromeOptions()
options.add_argument("--headless")
options.add_argument("start-maximized")#; // open Browser in maximized mode
options.add_argument("disable-infobars")#; // disabling infobars
options.add_argument("--disable-extensions")#; // disabling extensions
options.add_argument("--disable-gpu")#; // applicable to windows os only
options.add_argument("--disable-dev-shm-usage")#; // overcome limited resource problems
options.add_argument("--no-sandbox")#; // Bypass OS security model
options.add_argument("--remote-debugging-port=9222")
command_executor = "http://localhost:4444/wd/hub"
driver = webdriver.Chrome(options=options)


# Create a new instance of the Chrome driver
#driver = webdriver.Chrome()

# Navigate to the website
driver.get("https://www.saucedemo.com/")
print('performing login')
# Find the username and password fields and enter the credentials
username_field = driver.find_element(By.ID,"user-name")
password_field = driver.find_element(By.ID,"password")

username_field.send_keys("standard_user")
password_field.send_keys("secret_sauce")

# Submit the form
login_button = driver.find_element(by=By.ID,value='login-button')
login_button.click()
print('waiting for new site to be loaded')
# Wait for the page to load
sleep(2)

# Add all items to the cart
add_to_cart_buttons = driver.find_elements(by=By.CLASS_NAME,value="btn")
print('Found {} items to buy, add them to the cart'.format(len(add_to_cart_buttons)))
for button in add_to_cart_buttons:
    button.click()
print('Added all items to the cart, checking the cart now')
# Navigate to the cart page
cart_icon = driver.find_element(by=By.CSS_SELECTOR,value=".shopping_cart_link")
cart_icon.click()

# Verify that all items are added to the cart
remove_from_cart_buttons = driver.find_elements(by=By.CLASS_NAME,value="btn")
remove_from_cart_buttons = [x for x in remove_from_cart_buttons if x.text == 'Remove']
print('Found {} items in the cart, sould be {}: {}'.format(len(remove_from_cart_buttons),len(add_to_cart_buttons),'OK' if len(add_to_cart_buttons) == len(remove_from_cart_buttons) else 'Difference'))
assert len(remove_from_cart_buttons) == len(add_to_cart_buttons), "Not all items are added to the cart"
print('Removing all items from cart')
for button in remove_from_cart_buttons:
    button.click()
remove_from_cart_buttons = driver.find_elements(by=By.CLASS_NAME,value="btn")
remove_from_cart_buttons = [x for x in remove_from_cart_buttons if x.text == 'Remove']
assert len(remove_from_cart_buttons) == 0, "Not all items are removed to the cart"
print('Test finshed')
# Close the browser
driver.quit()
print('####################################################')
