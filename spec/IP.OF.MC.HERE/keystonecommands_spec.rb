current_directory = File.expand_path(File.dirname(__FILE__) )

require 'spec_helper'
require 'rspec/its'
require 'yaml'

@test_data = YAML.load_file(current_directory + "/../../helpers/config/test_data.yml")

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} tenant-create --name=#{@test_data["user_project"]} --description='#{@test_data["common_description"]}'") do
  its(:stdout) { should match /Property.*|.*Value/ }
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} user-create --name=#{@test_data["user_pa"]} --pass=#{@test_data["user_password"]} --email=#{@test_data["user_emailusername"]}+#{@test_data["user_pa"]}@#{@test_data["user_emaildomain"]} --tenant #{@test_data["user_project"]}") do
  its(:stdout) { should match /Property.*|.*Value/ }
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} user-role-add --user #{@test_data["user_pa"]} --tenant #{@test_data["user_project"]} --role project_admin") do
  it { should return_stdout '' }
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} user-role-remove --user #{@test_data["user_pa"]} --tenant #{@test_data["user_project"]} --role _member_") do
  it { should return_stdout '' }
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} user-create --name=#{@test_data["user_mem"]} --pass=#{@test_data["user_password"]} --email=#{@test_data["user_emailusername"]}+#{@test_data["user_mem"]}@#{@test_data["user_emaildomain"]} --tenant #{@test_data["user_project"]}") do
  its(:stdout) { should match /Property.*|.*Value/ }  
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} user-delete #{@test_data["user_mem"]}") do
  it { should return_stdout '' }
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} user-delete #{@test_data["user_pa"]}") do
  it { should return_stdout '' }
end

describe command("keystone --os-auth-url #{@test_data["os_auth_url"]} --os-username #{@test_data["def_admin_user"]} --os-password #{@test_data["def_admin_pass"]} --os-tenant-name #{@test_data["os_tenant_name"]} tenant-delete #{@test_data["user_project"]}") do
  it { should return_stdout '' }
end


