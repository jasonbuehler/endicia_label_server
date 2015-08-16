module EndiciaLabelServer
  GEM_NAME = 'endicia_label_server'

  CLASSES = [
    'postage_rate',
    'postage_rates',
    'user_sign_up',
    'postage_label',
    'change_pass_phrase'
  ]

  autoload :SERVICES,              "#{GEM_NAME}/services"

  autoload :Version,               "#{GEM_NAME}/version"
  autoload :Connection,            "#{GEM_NAME}/connection"
  autoload :Exceptions,            "#{GEM_NAME}/exceptions"
  autoload :Util,                  "#{GEM_NAME}/util"

  ['Builder', 'Parser'].each do |mod|
    defined_module = EndiciaLabelServer.const_set("#{mod}s".to_sym, Module.new)
    defined_module.autoload "#{mod}Base", Util.get_module_base_path(mod)

    CLASSES.each do |klass|
      defined_module.autoload Util.get_class_name(mod, klass),
                              Util.get_class_path(mod, klass)
    end
  end
end
