class BaseEvent < ActiveRecord::Base
    before_validation :find_aggregate
    before_create :apply_and_persist
  
    self.abstract_class = true
  
    def apply(aggregate)
      raise NotImplementedError
    end
  
    after_initialize do
      self.payload ||= {}
    end
  
    def self.payload_attributes(*attributes)
      @payload_attributes ||= []
  
      attributes.map(&:to_s).each do |attribute|
        @payload_attributes << attribute unless @payload_attributes.include?(attribute)
  
        define_method attribute do
          self.payload ||= {}
          self.payload[attribute]
        end
  
        define_method "#{attribute}=" do |argument|
          self.payload ||= {}
          self.payload[attribute] = argument
        end
      end
      @payload_attributes
    end

    private def apply_and_persist
        self.event_type = self.class.to_s
        self.aggregate = apply(aggregate)
        aggregate.save!
        self.aggregate_id = aggregate.id if aggregate_id.nil?
    end

    def find_aggregate
      klass = aggregate_name.to_s.classify.constantize
      self.aggregate = klass.find(aggregate_id)
    end
  
    def aggregate=(model)
      public_send "#{aggregate_name}=", model
    end
  
    def aggregate
      public_send aggregate_name
    end
  
    def aggregate_id=(id)
      public_send "#{aggregate_name}_id=", id
    end
  
    def aggregate_id    
      public_send "#{aggregate_name}_id"
    end
  
    def self.aggregate_name
      inferred_aggregate = reflect_on_all_associations(:belongs_to).first
      raise "Events must belong to an aggregate" if inferred_aggregate.nil?
      inferred_aggregate.name
    end
  
    delegate :aggregate_name, to: :class
  
    def event_klass
      klass = self.class.to_s.split("::")
      klass[-1] = event_type
      klass.join('::').constantize
    end
  end