module Correspond
  module Helpers
    HEADER_PATTERN = /^HTTP_(?!VERSION$)/

    def extract_headers(request)
      headers = request.env
        .select { |key, _| HEADER_PATTERN === key }
        .each_with_object({}) { |(k,v),h| h[headerize(k)] = v }
    end

    def headerize(key)
      key
        .downcase
        .sub(/^http_/, '')
        .gsub(/(\A|(?<=_))[a-z]/) { |m| m.upcase }
        .tr('_','-')
    end
  end
end
