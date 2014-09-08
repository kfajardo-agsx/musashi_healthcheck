module Common
  module UsersHelper

  def invite_new_pa(driver, email, project="")
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
      
    wait.until { driver.find_element(:css, "i.fa.fa-group").displayed? }
    driver.find_element(:css, "i.fa.fa-group").click
    sleep 3
    wait.until { driver.find_element(:xpath, "//button[@ng-click=\"invitePA()\"]").displayed? }
    driver.find_element(:xpath, "//button[@ng-click=\"invitePA()\"]").click
    wait.until { driver.find_element(:xpath, "//input[@ng-model=\"projectAdmin.email\"]").displayed? }
    driver.find_element(:xpath,"//input[@ng-model=\"projectAdmin.email\"]").send_keys(email)
    wait.until { driver.find_element(:xpath, "//button[@data-ng-click=\"next()\"]").displayed? }
    driver.find_element(:xpath, "//button[@data-ng-click=\"next()\"]").click
    if project!=""
      sleep 4 # wait for projects to load
      wait.until { driver.find_element(:xpath, "html/body/div[3]/div/div/div[2]/form/div[2]/div[2]/div/div/button").displayed? }
      driver.find_element(:xpath, "html/body/div[3]/div/div/div[2]/form/div[2]/div[2]/div/div/button").click
      wait.until { driver.find_element(:link, project).displayed? }
      driver.find_element(:link, project).click
      sleep 1
    end
    wait.until { driver.find_element(:xpath, "//button[normalize-space(text())=\"Send\"]").displayed? }
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Send\"]").click
    
    sleep 4
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/p/p").text =~ /Signup request has been sent to/) rescue false; sleep 2 }, "Timeout. Was unable to invite the PA successfully."    
    puts "Helper: Successfully invited new pa with address #{ email }."
  end
  
  def invite_sa(driver, username, email)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
    
    wait.until { driver.find_element(:css, "i.fa.fa-group").displayed? }
    driver.find_element(:css, "i.fa.fa-group").click
    sleep 3
    wait.until { driver.find_element(:xpath, "//button[@ng-click=\"createSA()\"]").displayed? }
    driver.find_element(:xpath, "//button[@ng-click=\"createSA()\"]").click
    wait.until { driver.find_element(:xpath, "//input[@ng-model=\"systemAdmin.username\"]").displayed? }
    driver.find_element(:xpath,"//input[@ng-model=\"systemAdmin.username\"]").send_keys(username)
    wait.until { driver.find_element(:xpath, "//input[@ng-model=\"systemAdmin.email\"]").displayed? }
    driver.find_element(:xpath,"//input[@ng-model=\"systemAdmin.email\"]").send_keys(email)
    wait.until { driver.find_element(:xpath, "//button[@data-ng-click=\"ok()\"]").displayed? }
    driver.find_element(:xpath, "//button[@data-ng-click=\"ok()\"]").click
    
    sleep 4
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/p/p").text =~ /Signup request has been sent to/) rescue false; sleep 2 }, "Timeout. Was unable to invite the PA successfully."    
    puts "Helper: Successfully invited sa with address #{ email }."
  end
  
  def invite_new_pm(driver, email)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
      
    wait.until { driver.find_element(:css, "i.fa.fa-group").displayed? }
    driver.find_element(:css, "i.fa.fa-group").click
    sleep 3
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"side-action\"]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"side-action\"]").click    
    wait.until { driver.find_element(:xpath, "//input[@ng-model=\"member.email\"]").displayed? }
    driver.find_element(:xpath, "//input[@ng-model=\"member.email\"]").send_keys(email)
    wait.until { driver.find_element(:xpath, "//button[normalize-space(text())=\"Send\"]").displayed? }
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Send\"]").click
    
    sleep 4
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/p/p").text =~ /Signup request has been sent to/) rescue false; sleep 2 }, "Timeout. Was unable to invite the PA successfully."    
    puts "Helper: Successfully invited pm with address #{ email }."
  end
  
  def signup_new_user(driver, username, display_name, password, project="")
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
  
    wait.until { driver.find_element(:name, "username").displayed? }
    driver.find_element(:name, "username").clear
    driver.find_element(:name, "username").send_keys(username)
    driver.find_element(:name, "display_name").clear
    driver.find_element(:name, "display_name").send_keys(display_name)
    driver.find_element(:name, "password").clear
    driver.find_element(:name, "password").send_keys(password)
    driver.find_element(:name, "password_confirmation").clear
    driver.find_element(:name, "password_confirmation").send_keys(password)
    
    if project!=""
      driver.find_element(:name, "project_name").clear
      driver.find_element(:name, "project_name").send_keys(project)
      driver.find_element(:name, "project_description").clear
      driver.find_element(:name, "project_description").send_keys(project)
    end
    
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Submit\"]").click
    sleep 3
    assert !180.times { break if (driver.find_element(:xpath, "//button[@ng-click=\"attemptLogin()\"]").displayed?) rescue false; sleep 2 }, "Timeout. Signup did not proceed to login page."
    puts "Helper: Successfully created account for #{ username }."  
  end
  
  def signup_sa(driver, display_name, password)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
  
    wait.until { driver.find_element(:name, "display_name").displayed? }
    driver.find_element(:name, "display_name").clear
    driver.find_element(:name, "display_name").send_keys(display_name)
    driver.find_element(:name, "password").clear
    driver.find_element(:name, "password").send_keys(password)
    driver.find_element(:name, "password_confirmation").clear
    driver.find_element(:name, "password_confirmation").send_keys(password)
    
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Submit\"]").click 
    sleep 3
    assert !180.times { break if (driver.find_element(:xpath, "//button[@ng-click=\"attemptLogin()\"]").displayed?) rescue false; sleep 2 }, "Timeout. Signup did not proceed to login page."
    puts "Helper: Successfully created account for #{ display_name }."  
  end
  
  def delete_member(driver, username)    
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
      
    wait.until { driver.find_element(:css, "i.fa.fa-group").displayed? }
    driver.find_element(:css, "i.fa.fa-group").click
    wait.until { driver.find_element(:xpath, "/html/body/div/div/div/div[2]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ username }\"]").displayed? }
    rows = driver.find_elements(:xpath, " /html/body/div/div/div/div[2]/div[2]/table/tbody/tr").size
    driver.find_element(:xpath, "//tr[@class=\"ng-scope\"]/td[normalize-space(text())=\"#{ username }\"]/..//button[2]").click
    driver.find_element(:xpath, "(//tr[@class=\"ng-scope\"]/td[normalize-space(text())=\"#{ username }\"]/..//a[contains(text(),'Delete Member')])").click
    wait.until { driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").click
  
    assert !180.times{ break if (driver.find_elements(:xpath, " /html/body/div/div/div/div[2]/div[2]/table/tbody/tr").size == (rows-1)) rescue false; sleep 1 }, "Timeout. Was unable to delete the PM successfully."
    puts "Helper: Successfully deleted member #{ username }"
  end
  
  def delete_user(driver, username)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
      
    wait.until { driver.find_element(:css, "i.fa.fa-group").displayed? }
    driver.find_element(:css, "i.fa.fa-group").click
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ username }\"]").displayed? }  
    rows = driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr").size
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ username }\"]/..//td/div/button[2]").click
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ username }\"]/..//td/div/ul/li[2]/a").click
    wait.until { driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").click

    assert !180.times{ break if (driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr").size == (rows-1)) rescue false; sleep 2 }, "Timeout. Was unable to delete the PA and Project successfully."    
    puts "Helper: Successfully deleted project and user #{ username }"
  end

  end
end