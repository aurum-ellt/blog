class BlobValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    return unless values.attached?

    Array(values).each do |value|
      if options[:content_type].present? && options[:content_type].exclude?(value.blob.content_type)
        record.errors.add(attribute, :content_type, content_types: options[:content_type].to_sentence)
      end

      if options[:max_size].present? && value.blob.byte_size > options[:max_size]
        record.errors.add(attribute, :max_size, max_size: ActiveSupport::NumberHelper.number_to_human_size(options[:max_size]))
      end
    end
  end
end
