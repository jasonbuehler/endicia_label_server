module EndiciaLabelServer
  module Util
    class << self
      def camelize(value)
        value.to_s.split('_').map { |v| capitalize_with_id_exception(v) }.join
      end

      def capitalize_with_id_exception(value)
        (value == 'id') ? 'ID' : value.capitalize
      end

      def singularize(word)
        if word =~ /([a-zA-Z]+?)(s\b|\b)/i
          return $1
        else
          return word
        end
      end

      def get_module_base_path(mod)
        [
          GEM_NAME,
          "#{mod.downcase}s",
          "#{mod.downcase}_base"
        ].join('/')
      end

      def get_class_path(mod, klass)
        [
          GEM_NAME,
          "#{mod.downcase}s",
          "#{klass}_#{mod.downcase}"
        ].join('/')
      end

      def get_class_name(mod, klass)
        "#{Util::camelize(klass)}#{mod}"
      end
    end
  end
end
