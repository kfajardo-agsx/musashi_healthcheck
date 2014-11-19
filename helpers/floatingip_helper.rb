module Common
  module FloatingIPHelper

  def attachIP(driver, instance_name, ip)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click

    # click attach button of ip
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td/div/button[1]").click

    # select instance to attach to 
    wait.until { driver.find_element(:xpath, "//div[@ng-model=\"fip.instance_option\"]/button").displayed? }
    driver.find_element(:xpath, "//div[@ng-model=\"fip.instance_option\"]/button").click
    wait.until { driver.find_element(:link, instance_name).displayed? }
    driver.find_element(:link, instance_name).click
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Attach\"]").click
     
    # wait until the IP is attached
    #wait.until { !(driver.find_element(:xpath, "//div[@ng-model=\"fip.instance_option\"]/button").displayed?) }
    sleep 2
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td[3]").text == instance_name) rescue false; sleep 1 }, "Timeout. It is taking too long to attach IP to instance."
    puts "Helper: Successfully attached floating IP #{ ip } to instance #{ instance_name }"
  end

  def detachIP(driver, instance_name)
    wait = Selenium::WebDriver::Wait.new(:timeout => 180)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click

    # click detach button of ip that is attached to instance
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr[2]/td[2]").displayed? }
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ instance_name }\"]/..//td[2]").displayed? }
    ip = driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ instance_name }\"]/..//td[2]").text
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ instance_name }\"]/..//td/div/button[1]").click
    
    # confirmation message
    wait.until { driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").click
    
    # wait until the IP is detached
    assert !180.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ ip }\"]/..//td/div/button[1]").text =~ /Attach/) rescue false; sleep 1 }, "Timeout. It is taking too long to detach the IP from instance."
    puts "Helper: Successfully detached an IP from instance #{ instance_name }"
  end

  def allocateIP(driver)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click
    sleep 2
    wait.until { driver.find_element(:xpath, "//button[@ng-click=\"allocateFloatingIP()\"]").displayed? }
    wait.until { driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr").displayed? }
    rows = driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr").size
    driver.find_element(:xpath, "//button[@ng-click=\"allocateFloatingIP()\"]").click
    #wait.until { driver.find_element(:xpath, "//div[@ng-model=\"floating_ip.pool\"]").displayed? }
    #driver.find_element(:xpath, "//button[normalize-space(text())=\"Allocate\"]").click
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr").size == (rows+1)) rescue false); sleep 1 }, "Unable to allocate an IP successfully."
    puts "Helper: Successfully allocated a floating IP"
  end

  def disallocateIP(driver, ip)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-lock").displayed? }
    driver.find_element(:css, "i.fa.fa-lock").click
    sleep 2
    !60.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"floating_ip in floating_ips\"]/td[normalize-space(text())=\"#{ ip }\"]").displayed? rescue false); sleep 1 }
    rows = driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"floating_ip in floating_ips\"]").size
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"floating_ip in floating_ips\"]/td[normalize-space(text())=\"#{ ip }\"]/..//td[4]/div/button[2]").click
    wait.until { driver.find_element(:link, "Release").displayed? }
    driver.find_element(:link, "Release").click
		sleep 2
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").displayed? }  
    driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").click
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"floating_ip in floating_ips\"]").size == (rows-1)) rescue false); sleep 1 }
    puts "Helper: Successfully released floating IP #{ ip }"
  end

  def createPool(driver, pool_name, ip_range)
	  wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-sitemap").displayed? }
    driver.find_element(:css, "i.fa.fa-sitemap").click
    sleep 5
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr").displayed? }
    rows = driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr").size

    driver.find_element(:xpath, "//*[@id=\"side-action\"]").click
    sleep 2
    
    wait.until { driver.find_element(:xpath, "//*[@id=\"displayName\"]").displayed? }
    
    driver.find_element(:id, "displayName").clear
    driver.find_element(:id, "displayName").send_keys(pool_name)
    driver.find_element(:id, "displayIpRange").clear
    driver.find_element(:id, "displayIpRange").send_keys(ip_range)
    driver.find_element(:xpath, "//div[3]/button[2]").click

    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr").size == (rows+1)) rescue false); sleep 1 }, "Timeout. Was not able to create an IP Pool successfully."
    puts "Helper: Successfully created an IP pool"
	end
  
  def deletePool(driver, pool_name)
	  wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-sitemap").displayed? }
    driver.find_element(:css, "i.fa.fa-sitemap").click
    sleep 5
    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr").displayed? }
    rows = driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr").size

    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[4]/div/button[2]/span").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[4]/div/button[2]/span").click
    
    wait.until { driver.find_element(:link, "Delete").displayed? }
    driver.find_element(:link, "Delete").click
    sleep 2

    wait.until { driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").click
    
    assert !60.times{ break if ((driver.find_elements(:xpath, "//*[@id=\"dv-main-content\"]/div/table/tbody/tr").size == (rows-1)) rescue false); sleep 1 }, "Timeout. Was not able to delete an IP Pool successfully."
    puts "Helper: Successfully deleted an IP pool"
	end
  
  def assignPooltoProject(driver, pool_name, project_name)
	  wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    wait.until { driver.find_element(:css, "i.fa.fa-sitemap").displayed? }
    driver.find_element(:css, "i.fa.fa-sitemap").click

    wait.until { driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[4]/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"dv-main-content\"]/div[2]/table/tbody/tr/td[normalize-space(text())=\"#{ pool_name }\"]/../td[4]/div/button[1]").click
    wait.until { driver.find_element(:xpath, "//*[@id=\"form-assign-pool\"]/div/div/div/button").displayed? }
    driver.find_element(:xpath, "//*[@id=\"form-assign-pool\"]/div/div/div/button").click
    
    wait.until { driver.find_element(:link, project_name).displayed? }
    driver.find_element(:link, project_name).click
    driver.find_element(:xpath, "//button[normalize-space(text())=\"Update\"]").click

    assert !60.times{ break if ((driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/p/p").text == "Successfully assigned " + pool_name + " to " + project_name) rescue false); sleep 1 }, "Timeout. Was not able to assign an IP Pool to project successfully."
    puts "Helper: Successfully assigned pool to project"
	end
  
  
  end
end
