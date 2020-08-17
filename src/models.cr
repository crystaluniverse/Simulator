require "yaml"

class Simulator::Model
    include YAML::Serializable

    def initialize; end
end

class Simulator::Hardware < Simulator::Model
    property description : String = ""
    property cost : Float64 = 0.0
    property cu_perc : Int32 = 0
    property su_perc : Int32 = 0
    property cru : Float64 = 0.0
    property mru : Float64 = 0.0
    property hru : Float64 = 0.0
    property sru : Float64 = 0.0
    property link : String = ""
    property passmark : String = ""
    property power : Int32 = 0
    property rackspace : Float64 = 0.0
end

# A Stack of (n) number of certain hardware item
class Simulator::HardwareSet < Simulator::Hardware
    property nr : Int32 = 0
end

# A computing device / machine
class Simulator::Device < Simulator::Model
    property hardware : Hash(String, Simulator::HardwareSet) = Hash(String, Simulator::HardwareSet).new
end

# A Stack of (n) number of certain device type
class Simulator::DeviceSet < Simulator::Device
    property nr : Int32 = 0
end

# Environment cost
class Simulator::EnvironmentCost < Simulator::Model
    property cost_power_kwh : Float64 = 0.0
    property cost_rack_unit : Int32 = 0
    property cost_mbitsec_month : Int32 = 0
    property cost_maintenance_percent_of_hw : Int32 = 0
    property months_writeoff : Int32 = 0
end

# Environment simulation configs
class Simulator::EnvironmentSimulation < Simulator::Model
    property startmonths : String = ""
    property active : Bool = true
end

# Environment network config
class Simulator::EnvironmentNetwork < Simulator::Model
    property nu_multiplier_from_cu : Int32 = 0
    property nu_multiplier_from_su : Int32 = 0
end

# AN Environment
class Simulator::Environment < Simulator::Model
    property description : String = ""
    property nodes : Hash(String, Simulator::DeviceSet) = Hash(String, Simulator::DeviceSet).new
    property overhead : Hash(String, Simulator::DeviceSet) = Hash(String, Simulator::DeviceSet).new
    property cost_env : Simulator::EnvironmentCost = Simulator::EnvironmentCost.new
    property simulation : Simulator::EnvironmentSimulation = Simulator::EnvironmentSimulation.new
    property network : Simulator::EnvironmentNetwork = Simulator::EnvironmentNetwork.new
end

# All Environments
class Simulator::Environments < Simulator::Model
    property environments : Hash(String, Simulator::Environment) = Hash(String, Simulator::Environment).new
end
