module Common
  module AuthenticationHelper
 
  def login(driver, username="", password="", project="", expect_entry=true) 
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:xpath, "//input[@type='text']").displayed? }
    driver.find_element(:xpath, "//input[@type='text']").clear
    driver.find_element(:xpath, "//input[@type='text']").send_keys(username)
    driver.find_element(:xpath, "//input[@type='password']").clear
    driver.find_element(:xpath, "//input[@type='password']").send_keys(password)
    driver.find_element(:xpath, "//*[@id=\"dash-login\"]/ng-form/div/button").click
    
    if project!=""
      wait.until { driver.find_element(:xpath, "//*[@id=\"head-project-name\"]").text == project }
      assert !60.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-mainbar\"]/div/div[2]/ul[3]/li[2]/a").displayed? rescue false); sleep 1 }, "Unable to login account."
    else
      assert !60.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-mainbar\"]/div/div[2]/ul[3]/li[3]/a").displayed? rescue false); sleep 1 }, "Unable to login account."
    end
    
    puts "Helper: Successfully logged in #{ username }"
  end

  def logout(driver, role="")
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    if role!="admin"
      wait.until { driver.find_element(:css, "i.fa.fa-hdd-o").displayed? }
      driver.find_element(:css, "i.fa.fa-hdd-o").click
      sleep 2
      wait.until { driver.find_element(:link_text, "Logout").displayed? }
      driver.find_element(:link_text, "Logout").click      
    else
      wait.until { driver.find_element(:css, "i.fa.fa-bar-chart-o").displayed? }
      driver.find_element(:css, "i.fa.fa-bar-chart-o").click
      sleep 2
      wait.until { driver.find_element(:link_text, "Logout").displayed? }
      driver.find_element(:link_text, "Logout").click      
    end
    
    assert !60.times{ break if (driver.find_element(:xpath, "//input[@type='text']").displayed? rescue false); sleep 1 }, "Unable to logout account."
    puts "Helper: Successfully logged out."
  end

  end
end