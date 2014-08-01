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
    @driver.get(@config["envi"] + "/")
    
    @admin_account = @test_data["def_admin_user"]
    @admin_pass = @test_data["def_admin_pass"]
  end

  def teardown
    @driver.quit
  end
  
  def test_dashboardfunctions
    @driver.manage().window().maximize()
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    
    sec_rules = [ {from:"-1", to:"-1", ip:"0.0.0.0/0", protocol:"ICMP"},
                  {from:"443", to:"443", ip:"0.0.0.0/0", protocol:"TCP"},
                  {from:"161", to:"161", ip:"0.0.0.0/0", protocol:"UDP"},
                  {from:"22", to:"22", ip:"0.0.0.0/0", protocol:"TCP"},
                  {from:"80", to:"80", ip:"0.0.0.0/0", protocol:"TCP"}
                ]
    
    puts "Logging in PM ..... "
    login(@driver, @test_data["user_mem"], @test_data["user_password"], @test_data["user_project"])
    puts "PM has accessed project successfully.\n"
    puts "\nCreating some access page resources..."
    import_keypair(@driver, @test_data["res_keypair"], @test_data["res_key"])
    create_secgroup(@driver, @test_data["res_secgroup"], @test_data["common_description"])
    custom_rule(@driver, @test_data["res_secgroup"], sec_rules)
    allocateIP(@driver)
    puts "\nCreating a VM and a snapshot..."
    createInstance(@driver, @test_data["res_instance"], @test_data["res_flavor"], @test_data["res_image"], "default", @test_data["res_keypair"])
    createVolume(@driver, @test_data["res_volume"], @test_data["common_description"], @test_data["res_volume_size"].to_i)
    attachVolume(@driver, @test_data["res_volume"], @test_data["res_instance"])
    wait.until { @driver.find_element(:css, "i.fa.fa-lock").displayed? }
    @driver.find_element(:css, "i.fa.fa-lock").click
    wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").displayed? }    
    ip = @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").text
    attachIP(@driver, @test_data["res_instance"], ip)
    createSnapshot(@driver, @test_data["res_instance"],  @test_data["res_snapshot"])
    logout(@driver)
    puts "PM has logged out."
    
    puts "\nLogging in PA ..... "
    # PA logs in to check and delete resources
    login(@driver, @test_data["user_pa"], @test_data["user_password"], @test_data["user_project"])
    puts "PA has accessed project successfully.\n"
    puts "\nPerforming some instance actions..."
    warning = 30
    error = 60
    update_instance_monitoring(@driver, @test_data["res_instance"], warning, error)
    stopInstance(@driver, @test_data["res_instance"])
    puts "\nGiving instance enough downtime before restarting...."
    sleep 90    
    puts "\nRestarting instance now."
    startInstance(@driver, @test_data["res_instance"])
    logout(@driver)
    puts "PA has logged out."
    
    puts "\nLogging in PM ..... "
    login(@driver, @test_data["user_mem"], @test_data["user_password"], @test_data["user_project"])
    puts "PM has accessed project successfully.\n"
    puts "\nCleaning up project...."
    detachVolume(@driver, @test_data["res_volume"])
    detachIP(@driver, @test_data["res_instance"])
    deleteAllVolumeSnapshots(@driver)
    deleteVolume(@driver, @test_data["res_volume"])
    delete_keypair(@driver, @test_data["res_keypair"])
    logout(@driver)
    puts "PM has logged out."
    
    puts "\nLogging in PA and continue cleaning up ..... "
    login(@driver, @test_data["user_pa"], @test_data["user_password"], @test_data["user_project"])
    puts "PA has accessed project successfully.\n"
    deleteSnapshot(@driver,  @test_data["res_snapshot"])
    deleteInstance(@driver, @test_data["res_instance"])
    delete_secgroup(@driver, @test_data["res_secgroup"])
    wait.until { @driver.find_element(:css, "i.fa.fa-lock").displayed? }
    @driver.find_element(:css, "i.fa.fa-lock").click
    wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").displayed? }    
    ip = @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").text
    disallocateIP(@driver, ip)
    delete_member(@driver, @test_data["user_mem"])
    logout(@driver)
    puts "PA has logged out."


    puts "\nLogging in admin ..... "
    login(@driver, @admin_account, @admin_pass)
    delete_pa(@driver, @test_data["user_pa"])
    logout(@driver, "admin")
  end

end