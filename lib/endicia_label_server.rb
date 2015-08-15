module EndiciaLabelServer
  GEM_NAME = 'endicia_label_server'

  autoload :SERVICES,              "#{GEM_NAME}/services"

  autoload :Version,               "#{GEM_NAME}/version"
  autoload :Connection,            "#{GEM_NAME}/connection"
  autoload :Exceptions,            "#{GEM_NAME}/exceptions"
  autoload :Util,                  "#{GEM_NAME}/util"


  ['Builder', 'Parser'].each do |mod|
    defined_module = EndiciaLabelServer.const_set("#{mod}s".to_sym, Module.new)
    defined_module.autoload "#{mod}Base", "#{GEM_NAME}/#{mod.downcase}s/#{mod.downcase}_base"

    [
      'postage_rate',
      'postage_rates',
      'user_sign_up',
      'postage_label',
      'change_pass_phrase'
    ].each do |klass|
      defined_module.autoload "#{Util::camelize(klass)}#{mod}", "#{GEM_NAME}/#{mod.downcase}s/#{klass}_#{mod.downcase}"
    end
  end
end
