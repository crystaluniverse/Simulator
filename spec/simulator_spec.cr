require "./spec_helper"
require "yaml"

describe Simulator do
  it "loads yaml" do
    path = Path.new(__FILE__, "..", "../config", "default").normalize.to_s
    devices = Path.new(path, "devices.yml")
    hardware = Path.new(path, "hardware.yml")
    env = Path.new(path, "environments.yml")
    all = Path.new(path, "all.yml")
    s = File.read(hardware) + File.read(devices) + File.read(env)
    pp! Simulator::Environments.from_yaml(s)
  end
end
