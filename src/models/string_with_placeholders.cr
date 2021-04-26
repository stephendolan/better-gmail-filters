class StringWithPlaceholders
  GREEDY_PLACEHOLDER_PATTERN = /{{\s*(.*?)\s*}}/

  def initialize(@original_string : String?)
  end

  def placeholders : Array(String)
    unless (string_to_scan = @original_string)
      return [] of String
    end

    string_to_scan
      .scan(GREEDY_PLACEHOLDER_PATTERN)
      .flat_map(&.captures)
      .reject(&.blank?)
      .compact
      .uniq!
  end
end
