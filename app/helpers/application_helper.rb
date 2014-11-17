class ActiveRecord::Base
  def active_model_serializer
    (self.class.to_s + 'Serializer').constantize
  end
end
module ApplicationHelper
  def serialize(object, options = {})
    klass = options[:serializer] || object.active_model_serializer
    options[:scope] ||= nil
    options[:root] ||= false
    serializer = klass.new(object, options)
    serializer
  end

  def serialize_collection(object, options = {})
    options[:each_serializer] ||= object.first.active_model_serializer
    options[:scope] ||= nil
    options[:root] ||= false
    serializer = ActiveModel::ArraySerializer.new(object, options)
    serializer
  end
end
