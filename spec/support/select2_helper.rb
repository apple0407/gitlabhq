# Select2 ajax programmatic helper
# It allows you to select value from select2
#
# Params
#   value - real value of selected item
#   opts - options containing css selector
#
# Usage:
#
#   select2(2, from: '#user_ids')
#

module Select2Helper
  def select2(value, options = {})
    raise ArgumentError, 'options must be a Hash' unless options.is_a?(Hash)

    selector = options.fetch(:from)

    if options[:multiple]
      execute_script("$('#{selector}').select2('val', ['#{value}']).trigger('change');")
    else
      execute_script("$('#{selector}').select2('val', '#{value}').trigger('change');")
    end
  end
end
