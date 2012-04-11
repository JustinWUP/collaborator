require 'active_resource/base'
require 'active_resource/validations'

module ActiveResource
  class Errors
    # https://github.com/rails/rails/commit/b09b2a8401c18d1efff21b3919ac280470a6eb8b

    def from_hash(messages, save_cache = false)
      clear unless save_cache

      messages.each do |(key,errors)|
        errors.each do |error|
          if @base.attributes.keys.include?(key)
            add key, error
          elsif key == 'base'
            self[:base] << error
          else
            # reporting an error on an attribute not in attributes
            # format and add themActive  to base
            self[:base] << "#{key.humanize} #{error}"
          end
        end
      end
    end

    # Grabs errors from a json response.
    def from_json(json, save_cache = false)
      decoded = ActiveSupport::JSON.decode(json) || {} rescue {}
      if decoded.kind_of?(Hash) && (decoded.has_key?('errors') || decoded.empty?)
        errors = decoded['errors'] || {}
        if errors.kind_of?(Array)
          # 3.2.1-style with array of strings
          ActiveSupport::Deprecation.warn('Returning errors as an array of strings is deprecated.')
          from_array errors, save_cache
        else
          # 3.2.2+ style
          from_hash errors, save_cache
        end
      else
        # <3.2-style respond_with - lacks 'errors' key
        ActiveSupport::Deprecation.warn('Returning errors as a hash without a root "errors" key is deprecated.')
        from_hash decoded, save_cache
      end
    end
  end
end