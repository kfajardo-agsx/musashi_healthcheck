module Common
  module SecurityGroupHelper

  def create_secgroup(driver, res_secgroup="", common_description="")
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    !60.times{ break if (driver.find_element(:css, "i.fa.fa-lock").displayed? rescue false); sleep 1 }
    driver.find_element(:css, "i.fa.fa-lock").click
    sleep 2
    
    !60.times{ break if (driver.find_element(:xpath, "//button[@ng-click=\"createSecGroup()\"]").displayed? rescue false); sleep 1 }
    rows = driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]").size
    driver.find_element(:xpath, "//button[@ng-click=\"createSecGroup()\"]").click
    sleep 2
    !60.times{ break if (driver.find_element(:name, "name").displayed? rescue false); sleep 1 }
    driver.find_element(:name, "name").clear
    driver.find_element(:name, "name").send_keys(res_secgroup)
    driver.find_element(:css, "textarea[name=\"description\"]").clear
    driver.find_element(:css, "textarea[name=\"description\"]").send_keys(common_description)
    driver.find_element(:xpath, "//div[3]/button[2]").click
    sleep 2

    assert !60.times{ break if (driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]").size == (rows+1)) rescue false; sleep 1 }, "Timeout. Was unable to create a secgroup successfully."
    puts "Helper: Successfully created security group #{ res_secgroup }"
  end

  def delete_secgroup(driver, res_secgroup)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    !60.times{ break if (driver.find_element(:css, "i.fa.fa-lock").displayed? rescue false); sleep 1 }
    driver.find_element(:css, "i.fa.fa-lock").click
    !60.times{ break if (driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]").displayed? rescue false); sleep 1 }
    rows = driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]").size
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]/../td[5]/div/button[2]/span").click
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]/../td[5]/div/ul/li/a").displayed?
    driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]/../td[5]/div/ul/li/a").click

    wait.until { driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").displayed? }
    driver.find_element(:xpath, "//*[@id=\"alert_id\"]/div/div/button[1]").click  
    assert !60.times{ break if (driver.find_elements(:xpath, "//*[@id=\"dash-access\"]/div/table/tbody/tr[@ng-repeat=\"secGroup in secGroups\"]").size == (rows-1)) rescue false; sleep 1 }, "Timeout. Was unable to delete a secgroup successfully."
    puts "Helper: Successfully deleted security group #{ res_secgroup }"
  end

  def custom_rule(driver, res_secgroup, sec_rules)
    sleep 5  
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    !60.times{ break if (driver.find_element(:css, "i.fa.fa-lock").displayed? rescue false); sleep 1 }
    driver.find_element(:css, "i.fa.fa-lock").click
    !60.times{ break if (driver.find_element(:xpath, "//tr[@class=\"ng-scope\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]").displayed? rescue false); sleep 1 }    
    wait.until { driver.find_element(:xpath, "//tr[@class=\"ng-scope\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]/..//td[5]/div/button[1]").displayed? }
    driver.find_element(:xpath, "//tr[@class=\"ng-scope\"]/td[normalize-space(text())=\"#{ res_secgroup }\"]/..//td[5]/div/button[1]").click
    wait.until { (driver.find_element(:id, "form-manage-sec-group")).displayed? }
    wait.until { driver.find_element(:xpath, "//div[@ng-model=\"rule.ruleOption\"]/button/span[1]/span").displayed? }
    addRule(driver, sec_rules)
    
    driver.find_element(:css, "body > div.modal.fade.dash-width-500.in > div > div > div.modal-footer.ng-scope > button.btn.btn-primary.ng-binding").click  
    #wait.until { !(driver.find_element(:id, "form-manage-sec-group").displayed?)}
    puts "Helper: Successfully added custom rules to #{ res_secgroup }"
  end
  
  def addRule(driver, sec_rules)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    if sec_rules.length > 0 then
      sec_rules.each do |rule|
        wait.until { driver.find_element(:xpath, "//div[@ng-model=\"rule.ruleOption\"]/button/span[1]/span").displayed? }
        driver.find_element(:xpath, "//div[@ng-model=\"rule.ruleOption\"]/button/span[1]/span").click
        wait.until { driver.find_element(:link, "Custom").displayed? }
        driver.find_element(:link, "Custom").click
        wait.until { driver.find_element(:xpath, "//div[@ng-model=\"newRule.ip_protocol\"]/button/span[1]/span").displayed? }
        driver.find_element(:xpath, "//div[@ng-model=\"newRule.ip_protocol\"]/button/span[1]/span").click
        wait.until { driver.find_element(:link, rule[:protocol]).displayed? }
        driver.find_element(:link, rule[:protocol]).click
        driver.find_element(:name, "from_port").clear
        driver.find_element(:name, "from_port").send_keys(rule[:from])
        driver.find_element(:name, "to_port").clear
        driver.find_element(:name, "to_port").send_keys(rule[:to])
        driver.find_element(:name, "ip_range").clear
        driver.find_element(:name, "ip_range").send_keys(rule[:ip])
        wait.until { driver.find_element(:xpath, "//button[@ng-click=\"addRule()\"]").displayed? }
        driver.find_element(:xpath, "//button[@ng-click=\"addRule()\"]").click
        sleep 2
      end
    end
  end
  
  end
end