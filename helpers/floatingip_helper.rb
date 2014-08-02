module Common
  module FloatingIPHelper

  def attachIP(driver, instance_name, ip)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click

    # click attach button of ip
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td/div/button[1]").click
    
    # select instance to attach to 
    wait.until { driver.find_element(:xpath, "//div[@ng-model=\"fip.instance_option\"]/button").displayed? }
    driver.find_element(:xpath, "//div[@ng-model=\"fip.instance_option\"]/button").click
    wait.until { driver.find_element(:link, instance_name).displayed? }
    driver.find_element(:link, instance_name).click
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Attach\"]").click
     
    # wait until the IP is attached
    wait.until { !(driver.find_element(:xpath, "//div[@ng-model=\"fip.instance_option\"]/button").displayed?) }
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td[3]").text == instance_name) rescue false; sleep 1 }, "Timeout. It is taking too long to attach IP to instance."
    puts "Helper: Successfully attached floating IP #{ ip } to instance #{ instance_name }"
  end

  def detachIP(driver, instance_name)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click

    # click detach button of ip that is attached to instance
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").displayed? }
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ instance_name }\"]/..//td[2]").displayed? }
    ip = driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ instance_name }\"]/..//td[2]").text
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ instance_name }\"]/..//td/div/button[1]").click
    
    # confirmation message
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/div/button[1]").click
    
    # wait until the IP is detached
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td/div/button[1]").text =~ /Attach/) rescue false; sleep 1 }, "Timeout. It is taking too long to detach the IP from instance."
    puts "Helper: Successfully detached an IP from instance #{ instance_name }"
  end

  def allocateIP(driver)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click
    sleep 2
    wait.until { driver.find_element(:xpath, "//div[@id='dash-access']/div[3]/div[2]/button").displayed? }
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr").displayed? }
    rows = driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr").size
    driver.find_element(:xpath, "//div[@id='dash-access']/div[3]/div[2]/button").click
    wait.until { driver.find_element(:xpath, "//div[@ng-model=\"floating_ip.pool\"]").displayed? }
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Allocate\"]").click
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr").size == (rows+1)) rescue false); sleep 1 }, "Unable to allocate an IP successfully."
    puts "Helper: Successfully allocated a floating IP"
  end

  def disallocateIP(driver, ip)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click
    sleep 2
    !60.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]").displayed? rescue false); sleep 1 }
    rows = driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr").size
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td[4]/div/button[2]").click
    wait.until { driver.find_element(:link, "Release").displayed? }
    driver.find_element(:link, "Release").click
		sleep 2
      
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/div/button[1]").click
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr").size == (rows-1)) rescue false); sleep 1 }
    puts "Helper: Successfully released floating IP #{ ip }"
  end

  def createPool(driver, pool_name, ip_range)
	  wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-sitemap").displayed? }
    driver.find_element(:css, "i.fa.fa-sitemap").click
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[3]/div[2]/button").displayed? }
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr").displayed? }
    rows = driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr").size
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[3]/div[2]/button").click
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"displayName\"]").displayed? }
    
    driver.find_element(:id, "displayName").clear
    driver.find_element(:id, "displayName").send_keys(pool_name)
    driver.find_element(:id, "displayIpRange").clear
    driver.find_element(:id, "displayIpRange").send_keys(ip_range)
    driver.find_element(:xpath, "//div[3]/button[2]").click
    
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr").size == (rows+1)) rescue false); sleep 1 }, "Timeout. Was not able to create an IP Pool successfully."
    puts "Helper: Successfully created an IP pool"
	end
  
  def deletePool(driver, pool_name)
	  wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-sitemap").displayed? }
    driver.find_element(:css, "i.fa.fa-sitemap").click
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[3]/div[2]/button").displayed? }
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr").displayed? }
    rows = driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr").size
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[3]/div/button[2]/span").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[3]/div/button[2]/span").click
    wait.until { driver.find_element(:link, "Delete").displayed? }
    driver.find_element(:link, "Delete").click
    sleep 2
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/div/button[1]").click
    
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr").size == (rows-1)) rescue false); sleep 1 }, "Timeout. Was not able to create an IP Pool successfully."
    puts "Helper: Successfully deleted an IP pool"
	end
  
  def assignPooltoProject(driver, pool_name, project_name)
	  wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-sitemap").displayed? }
    driver.find_element(:css, "i.fa.fa-sitemap").click
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[3]/div[2]/button").displayed? }
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[2]/div/div/button/span[2]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[2]/div/div/button/span[2]").click
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[2]/div/div/ul/li/a/span[normalize-space(text())=\"#{ project_name }\"]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[2]/div/div/ul/li/a/span[normalize-space(text())=\"#{ project_name }\"]").click
    
    assert !60.times{ break if ((driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[1]/div/div/p/p").text == "Successful association of project for " + pool_name + ".") rescue false); sleep 1 }, "Timeout. Was not able to assign an IP Pool to project successfully."
    puts "Helper: Successfully assigned pool to project"
	end
  
  
  end
end
