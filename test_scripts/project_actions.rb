current_directory = File.expand_path(File.dirname(__FILE__))
require current_directory + "/../test_helper"

class ScenarioA < MiniTest::Test

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
    @db = SQLite3::Database.new "testdb.db"
    @driver = Selenium::WebDriver.for @config["test_browser"].to_sym
    @driver.get(@config["envi"] + "/")
    
    @admin_account = @test_data["def_admin_user"]
    @admin_pass = @test_data["def_admin_pass"]
  end

  def teardown
    @driver.quit
  end
  
  def test_wholeOperation
    @driver.manage().window().maximize()
    sec_rules = [ {from:"-1", to:"-1", ip:"0.0.0.0/0", protocol:"ICMP"},
                  {from:"443", to:"443", ip:"0.0.0.0/0", protocol:"TCP"},
                  {from:"161", to:"161", ip:"0.0.0.0/0", protocol:"UDP"},
                  {from:"22", to:"22", ip:"0.0.0.0/0", protocol:"TCP"},
                  {from:"80", to:"80", ip:"0.0.0.0/0", protocol:"TCP"}
                ]
    
    # PM logs in to create resources
    puts "Logging in PM ..... "
    login(@driver, @test_data["user_mem"], @test_data["user_password"])
    wait.until { @driver.find_element(:xpath, "//*[@id=\"head-project-name\"]/span/span").text == @test_data["user_project"] + 0.to_s }
    puts "PM has accessed project successfully.\n"

    puts "Creating some access page resources..."
    import_keypair(@driver, @test_data["res_keypair"], @test_data["res_key"])
    puts "Keypair created."
    
    create_secgroup(@driver, @test_data["res_secgroup"], @test_data["common_description"])
    puts "Secgroup created."
    
    custom_rule(@driver, @test_data["res_secgroup"], sec_rules)
    puts "Added rules to secgroup."
    
    allocateIP(@driver)
    puts "IP allocated.\n"
    
    puts "Creating a VM and a snapshot..."
    createInstance(@driver, @test_data["res_instance"], @test_data["res_flavor"], @test_data["res_image"], "default", @test_data["res_keypair"])
    puts "Instance created."
    
    createVolume(@driver, @test_data["res_volume"], @test_data["common_description"], @test_data["res_volume_size"].to_i)
    puts "Volume created."
    
    attachVolume(@driver, @test_data["res_volume"], @test_data["res_instance"])
    puts "Volume attached."
    
    wait.until { @driver.find_element(:css, "i.fa.fa-lock").displayed? }
    @driver.find_element(:css, "i.fa.fa-lock").click
    wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").displayed? }    
    ip = @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").text
    attachIP(@driver, @test_data["res_instance"], ip)
    puts "IP attached to instance."
    
    createSnapshot(@driver, @test_data["res_instance"],  @test_data["res_snapshot"])
    puts "Instance snapshot created.\n"
    logout(@driver)
    puts "PM has logged out."
    
    puts "Logging in PA ..... "
    # PA logs in to check and delete resources
    login(@driver, @test_data["user_pa"], @test_data["user_password"])
    wait.until { @driver.find_element(:xpath, "//*[@id=\"head-project-name\"]/span/span").text == @test_data["user_project"] + 0.to_s }
    puts "PA has accessed project successfully.\n"
 
    puts "Performing some instance actions..."
    warning = 30
    error = 60
    update_instance_monitoring(@driver, @test_data["res_instance"], warning, error)
    puts "Updated instance monitoring thresholds."
    
    stopInstance(@driver, @test_data["res_instance"])
    puts "Stopped instance."
    
    puts "Giving instance enough downtime before restarting...."
    sleep 90    
    puts "Restarting instance now."
    
    startInstance(@driver, @test_data["res_instance"])
    puts "Restarted instance.\n"

    puts "Cleaning up project...."
    
    detachVolume(@driver, @test_data["res_volume"] + i.to_s)
    puts "Detached volume."
    
    detachIP(@driver, @test_data["res_instance"] + i.to_s)
    puts "Detached IP."
    
    deleteAllVolumeSnapshots(@driver)
    puts "Cleaned up volume snapshots."
    
    deleteVolume(@driver, @test_data["res_volume"] + i.to_s)
    puts "Deleted volume."
    
    deleteSnapshot(@driver,  @test_data["res_snapshot"])
    puts "Deleted instance snapshot./n"
     
    deleteInstance(@driver, @test_data["res_instance"])
    puts "Deleted instance."
    
    delete_keypair(@driver, @test_data["res_keypair"])
    puts "Deleted keypair."

    delete_secgroup(@driver, @test_data["res_secgroup"])
    puts "Deleted secgroup."
    
    wait.until { @driver.find_element(:css, "i.fa.fa-lock").displayed? }
    @driver.find_element(:css, "i.fa.fa-lock").click
    for i in loop_start..loop_end
      wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").displayed? }    
      ip = @driver.find_element(:xpath, "//*[@id=\"dash-access\"]/table[1]/tbody/tr[2]/td[2]").text
      disallocateIP(@driver, ip)
    end
    puts "Released floating IP."
    
    delete_member(@driver, @test_data["user_mem"])
    puts "Deleted PM."
    sleep 10
    logout(@driver)
    puts "Cleaned up project. PA has logged out."


    puts "Logging in admin ..... "
    login(@driver, @admin_account, @admin_pass)
    wait.until { @driver.find_element(:xpath, "//*[@id=\"dash-mainbar\"]/div/div[2]/ul[2]/li[1]/span").text =~ /SYSTEM ADMIN/ }
    
    ## DELETE PROJECTS/PAS
    #pa_result = @db.execute("select pa from userindex").first.map(&:to_i)
    #current_pa_index = pa_result[0]
    #last_pa_index = current_pa_index + loop_end
    #for i in current_pa_index..last_pa_index
    #  delete_pa(@driver, @test_data["user_pa"] + i.to_s)
    #end
    #@db.execute "update userindex set pa=?", last_pa_index + 1
    #puts "Deleted #{ loop_end } project admins and their projects."
    logout(@driver)
  end

end