from pyvirtualdisplay import Display
from selenium import webdriver

display = Display(visible=0, size=(800, 600))
display.start()

driver = webdriver.Firefox()
driver.get('http://localhost:8080/jpetstore/')

print driver.page_source

assert "Welcome to JPetStore 6" in driver.page_source
