require 'ox'

module EndiciaLabelServer
  module Builders
    # The {BuilderBase} class builds Endicia XML Objects.
    #
    # @author Paul Trippett
    # @since 0.1.0
    # @abstract
    # @attr [Ox::Document] document The XML Document being built
    # @attr [Ox::Element] root The XML Root
    class BuilderBase
      include Ox
      include Exceptions

      attr_accessor :document,
                    :root

      # Initializes a new {BuilderBase} object
      #
      # @param [String] root_name The Name of the XML Root
      # @return [void]
      def initialize(root_name, opts = {})
        initialize_xml_roots root_name

        document << root

        opts.each_pair { |k, v| add(k, v) }
      end

      def add(*args)
        first_arg = args.first
        last_arg = args.last
        root_key = Util.camelize(first_arg)

        if last_arg.is_a? Hash
          add_hash root_key, last_arg
        elsif last_arg.is_a? Array

        else
          root << element_with_value(root_key, last_arg)
        end
      end

      def add_hash(root_key, data)
        xml_root_key = xmlify_key_name(root_key)
        root << Element.new(xml_root_key).tap do |org|
          data.each_pair do |key, value|
            xml_child_key = (key.is_a? String) ? key : Util.camelize(key)
            org << element_with_value(xml_child_key, value)
          end
        end
      end

      def add_array(root_key, data)
        xml_root_key = Util.camelize(root_key)
        root << Element.new(xml_root_key).tap do |org|
          child_key = "#{Util.singularize(xml_root_key)}ID"
          data.each do |value|
            org << element_with_value(child_key, value)
          end
        end
      end

      # Returns a String representation of the XML document being built
      #
      # @return [String]
      def to_xml
        Ox.to_xml document
      end

      def to_http_post
        "#{post_field}=#{to_xml}"
      end

      private

      def initialize_xml_roots(root_name)
        self.document = Document.new
        self.root = Element.new(root_name)
      end

      def element_with_value(name, value)
        fail InvalidAttributeError, name unless value.respond_to?(:to_s)
        Element.new(name).tap do |request_action|
          request_action << value.to_s
        end
      end

      def xmlify_key_name(key)
        (key.is_a? String) ? key : Util.camelize(key)
      end
    end
  end
end
