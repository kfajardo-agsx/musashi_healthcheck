require 'spec_helper'
require 'rspec/its'

describe file('/etc/riemann/musashi_config.clj') do
  its(:content) { should match /; Target list/ }
  its(:content) { should match /\(def LISTFILE       "\/etc\/riemann\/(.*?)_evaluation_list"\)/ }
  its(:content) { should match /; Config of Graphite/ }
  its(:content) { should match /\(def graph          \(graphite {:host \(System\/getenv "GRAPHITE_PORT_8126_TCP_ADDR"\)}\)\)/ }
  its(:content) { should match /; Mail Options/ }
  its(:content) { should match /\(def FROM_ADDRESS   "no-reply@(.*?).ph"\)/ }
  its(:content) { should match /;\(def SMTP_SERVER    "localhost"\)/ }
  its(:content) { should match /;\(def SMTP_OPTION    {:host SMTP_SERVER}\)/ }
  its(:content) { should match /\(def SMTP_OPTION\s+{:host "smtp.gmail.com"\s+:port 587\s+:tls true\s+:user "no-reply@(.*?).(.*?)"\s+:pass "(.*?)"}\) ; Use sendmail\s+\(def HP_ADDRESS\s+\(System\/getenv "(.*?)"\)\)/ }
  its(:content) { should match /; Debug Options/ }
  its(:content) { should match /\(def DEBUGFILE     "\/etc\/riemann\/(.*?)_debug.txt"\)/ }
end
