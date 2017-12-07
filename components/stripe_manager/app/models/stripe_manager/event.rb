module StripeManager
  class Event < ApplicationRecord
    self.inheritance_column = :dummy

    attr_reader :dummy

    def initialize_with(hash:)
      self.identifier = hash.delete(:id)
      self.created = DateTime.strptime(hash.delete(:created).to_s,'%s')
      self.object_id = hash.dig(:data, :object, :id)

      hash.each do |key, value|
        self[key] = value if has_attribute?(key)
      end

      self
    end
  end
end
