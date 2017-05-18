from selenium import webdriver

driver = webdriver.Chrome()
driver.get('http://localhost:8080/jpetstore/')
# print driver.page_source

assert "Welcome to JPetStore 6" in driver.page_source