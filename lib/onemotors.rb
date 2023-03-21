# frozen_string_literal: true

require_relative 'onemotors/version'
require 'f1sales_custom/parser'
require 'f1sales_custom/source'
require 'f1sales_custom/hooks'

module Onemotors
  class Error < StandardError; end

  class F1SalesCustom::Hooks::Lead
    class << self
      def switch_source(lead)
        @lead = lead
        source_name = lead.source.name

        return "#{source_name} - LST" if product_name['LST']

        return "#{source_name} - LTS" if product_name['LTS']

        return "#{source_name} - LPG" if product_name['LPG']

        return "#{source_name} - LPP" if product_name['LPP']

        source_name
      end

      def product_name
        @lead.product.name
      end
    end
  end
end
