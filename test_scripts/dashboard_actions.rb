current_directory = File.expand_path(File.dirname(__FILE__))
require current_directory + "/../test_helper"

class DashboardActions < MiniTest::Test

  include Common::AuthenticationHelper
  include Common::UsersHelper
  include Common::MonitoringHelper
  include Common::InstanceHelper
  include Common::FloatingIPHelper
  include Common::KeypairHelper
  include Common::VolumeHelper
  include Common::QuotaHelper
  include Common::SecurityGroupHelper 
  
  def setup
    @test_data = Data.config.test_data
    @config = Data.config.setup
    
    @driver = Selenium::WebDriver.for @config["test_browser"].to_sym
    @driver.get(@config["envi"] + "/session/new")
  end

  def teardown
    @driver.quit
  end
  
  def get_token(email)
    token = ""
    options = Net::SSH::Config.for(@test_data["host"])
    if ENV['ASK_LOGIN_PASSWORD']
      require 'highline/import'
      options[:password] = ask("\nEnter login password: ") { |q| q.echo = false }
    else
        options[:password] = ENV['PASSWORD']
    end
    if !(ENV['KEY'].nil?)
      options[:keys] = ENV['KEY']
      options[:auth_methods] = ['publickey']
    end
    if !(ENV['PORT'].nil?)
      options[:port] = ENV['PORT']
    else
      options[:port] = 22
    end

    Net::SSH.start(@test_data["host"], ENV['USER'], options) do |ssh|
      token = ssh.exec!("redis-cli -a #{ @test_data["redis_password"] } hget 'signup_invites.emails.#{ email }' token")
      puts "Invitation token for user: #{ token }"  
    end
    
    token
  end
  
  def get_link(token)
    link = @config["envi"] + "/registration/signup?token=" + token
    
    link
  end
  
  def create_accounts
    @driver.manage().window().maximize()
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)

    pa_email = "#{ @test_data["user_emailusername"] }+#{ @test_data["user_pa"] }#{ @test_data["user_emaildomain"] }"
    sa_email = "#{ @test_data["user_emailusername"] }+#{ @test_data["user_admin"] }#{ @test_data["user_emaildomain"] }"
    pm_email = "#{ @test_data["user_emailusername"] }+#{ @test_data["user_pm"] }#{ @test_data["user_emaildomain"] }"
    
    puts "====SIGNING UP REQUIRED USERS FOR HEALTHCHECK===="
    login(@driver, @test_data["def_admin_user"], @test_data["def_admin_pass"])
    invite_new_pa(@driver, pa_email)
    wait.until { @driver.find_element(:css, "i.fa.fa-bar-chart-o").displayed? }
    @driver.find_element(:css, "i.fa.fa-bar-chart-o").click
    invite_sa(@driver, @test_data["user_admin"], sa_email)
    sleep 2
    logout(@driver, true)
    
    @driver.get(get_link(get_token(pa_email)))
    signup_new_user(@driver, @test_data["user_pa"], @test_data["user_pa"], @test_data["user_password"], @test_data["user_project"])

    @driver.get(get_link(get_token(sa_email)))
    signup_sa(@driver, @test_data["user_admin"], @test_data["user_password"])
    
    login(@driver, @test_data["user_pa"], @test_data["user_password"], @test_data["user_project"])
    invite_new_pm(@driver, pm_email)
    sleep 2
    logout(@driver)
    
    @driver.get(get_link(get_token(pm_email)))
    signup_new_user(@driver, @test_data["user_pm"], @test_data["user_pm"], @test_data["user_password"])
    sleep 2
    puts "====CREATION OF ACCOUNTS DONE===\n\n"
  end
  
  def perform_actions
    @driver.manage().window().maximize()
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
  
    sec_rules = [ {from:"-1", to:"-1", ip:"0.0.0.0/0", protocol:"ICMP"},
                  {from:"443", to:"443", ip:"0.0.0.0/0", protocol:"TCP"},
                  {from:"161", to:"161", ip:"0.0.0.0/0", protocol:"UDP"},
                  {from:"22", to:"22", ip:"0.0.0.0/0", protocol:"TCP"},
                  {from:"80", to:"80", ip:"0.0.0.0/0", protocol:"TCP"}
                ]
    
    puts "====TESTING RESOURCE CREATION===="
    login(@driver, @test_data["user_admin"], @test_data["user_password"])
    puts " >> Admin is creating pool for project"
    createPool(@driver, @test_data["user_pool"], @test_data["user_pool_ip_range"])
    assignPooltoProject(@driver, @test_data["user_pool"], @test_data["user_project"])
    logout(@driver, true)
    
    puts " >> PM is creating project resources"
    login(@driver, @test_data["user_pm"], @test_data["user_password"], @test_data["user_project"])
    puts "......... Access page resources"
    import_keypair(@driver, @test_data["res_keypair"], @test_data["res_key"])
    sleep 2
    create_secgroup(@driver, @test_data["res_secgroup"], @test_data["common_description"])
    sleep 2
    custom_rule(@driver, @test_data["res_secgroup"], sec_rules)
    sleep 2
    allocateIP(@driver)
    sleep 2
    puts "......... VM and snapshot"
    createInstance(@driver, @test_data["res_instance"], @test_data["res_flavor"], @test_data["res_image"], "default", @test_data["res_keypair"])
    sleep 2
    createVolume(@driver, @test_data["res_volume"], @test_data["common_description"], @test_data["res_volume_size"].to_i)
    sleep 2
    attachVolume(@driver, @test_data["res_volume"], @test_data["res_instance"])
    sleep 2
    @driver.find_element(:css, "i.fa.fa-lock").click
    wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr[2]/td[2]").displayed? }    
    ip = @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr[2]/td[2]").text
    attachIP(@driver, @test_data["res_instance"], ip)
    sleep 2
    createSnapshot(@driver, @test_data["res_instance"],  @test_data["res_snapshot"])
    sleep 3
    logout(@driver)
    
    puts " >> PA is doing some resource actions"
    login(@driver, @test_data["user_pa"], @test_data["user_password"], @test_data["user_project"])
    sleep 5
    warning = 30
    error = 60
    puts "......... Updating instance monitoring settings"
    update_instance_monitoring(@driver, @test_data["res_instance"], warning, error)
    sleep 2
    puts "......... Stopping instance"
    stopInstance(@driver, @test_data["res_instance"])
    puts "......... Giving instance enough downtime before restarting...."
    sleep 90    
    puts "......... Restarting instance now."
    startInstance(@driver, @test_data["res_instance"])
    sleep 3
    logout(@driver)
    puts "====CREATION OF RESOURCES DONE===\n\n"
  end
   
  def cleanup 
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
  
    puts "====CLEANUP OF RESOURCES==="
    
    puts " >> PM is doing part of the cleanup of project"
    login(@driver, @test_data["user_pm"], @test_data["user_password"], @test_data["user_project"])
    detachVolume(@driver, @test_data["res_volume"])
    sleep 2
    detachIP(@driver, @test_data["res_instance"])
    sleep 3
    deleteAllVolumeSnapshots(@driver)
    sleep 2
    deleteVolume(@driver, @test_data["res_volume"])
    sleep 2
    delete_keypair(@driver, @test_data["res_keypair"])
    sleep 3
    logout(@driver)

    puts " >> PA is doing his part in cleanup of project and PM account"
    login(@driver, @test_data["user_pa"], @test_data["user_password"], @test_data["user_project"])
    sleep 5 
    deleteSnapshot(@driver,  @test_data["res_snapshot"])
    sleep 2
    deleteInstance(@driver, @test_data["res_instance"])
    sleep 2
    delete_secgroup(@driver, @test_data["res_secgroup"])
    sleep 2
    wait.until { @driver.find_element(:css, "i.fa.fa-lock").displayed? }
    @driver.find_element(:css, "i.fa.fa-lock").click
    wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr[2]/td[2]").displayed? }    
    ip = @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/div[2]/table/tbody/tr[2]/td[2]").text
    disallocateIP(@driver, ip)
    sleep 2
    
    delete_member(@driver, @test_data["user_mem"])
    sleep 3
    logout(@driver)
    
    puts " >> Default admin will delete project and users created"
    login(@driver, @test_data["def_admin_user"], @test_data["def_admin_pass"])
    deletePool(@driver,  @test_data["user_pool"])
    sleep 3
    delete_user(@driver, @test_data["user_pa"])
    sleep 3
    delete_user(@driver, @test_data["user_admin"])
    sleep 3
    logout(@driver, true)
    puts "====CLEANUP DONE==="
  end
  
  def test_health_of_dashboard
    create_accounts
    perform_actions
    cleanup
  end

end