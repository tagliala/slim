module Slim
  # Base class for Temple filters used in Slim
  #
  # This base filter passes everything through and allows
  # to override only some methods without affecting the rest
  # of the expression.
  #
  # @api private
  class Filter < Temple::HTML::Filter
    # Dispatch on_slim_*
    temple_dispatch :slim

    def on_slim_embedded(type, content)
      [:slim, :embedded, code, compile(content)]
    end

    def on_slim_control(code, content)
      [:slim, :control, code, compile(content)]
    end

    def on_slim_condcomment(condition, content)
      [:slim, :condcomment, condition, compile(content)]
    end

    def on_slim_output(code, escape, content)
      [:slim, :output, code, escape, compile(content)]
    end
  end
end
