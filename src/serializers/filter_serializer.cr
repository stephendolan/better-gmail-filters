require "xml"

class FilterSerializer < BaseSerializer
  def self.for_collection(filters : FilterQuery)
    XML.build(indent: "  ") do |xml|
      xml.element "feed", xmlns: "http://www.w3.org/2005/Atom", "xmlns:apps": "http://schemas.google.com/apps/2006" do
        xml.element "title" { xml.text Application.settings.name }
        filters.each do |filter|
          search_permutations = filter.search_permutations
          search_permutations.each_with_index(1) do |search_query, index|
            xml.element "entry" do
              xml.element "category", term: "filter"
              xml.element "title" { xml.text "#{filter.name} #{index}/#{search_permutations.size}" }
              xml.element "apps:property", name: "hasTheWord", value: search_query

              if (value = filter.should_apply_label)
                xml.element "apps:property", name: "label", value: value
              end

              if (value = filter.should_forward_to)
                xml.element "apps:property", name: "forward_to", value: value
              end

              if (value = filter.should_mark_as_read)
                xml.element "apps:property", name: "shouldMarkAsRead", value: value.to_s
              end

              if (value = filter.should_archive)
                xml.element "apps:property", name: "shouldArchive", value: value.to_s
              end

              if (value = filter.should_star)
                xml.element "apps:property", name: "shouldStar", value: value.to_s
              end

              if (value = filter.should_never_mark_spam)
                xml.element "apps:property", name: "shouldNeverSpam", value: value.to_s
              end

              if (value = filter.should_mark_important)
                xml.element "apps:property", name: "shouldAlwaysMarkAsImportant", value: value.to_s
              end

              # These are Gmail defaults, and we don't allow overrides
              xml.element "apps:property", name: "sizeOperator", value: "s_sl"
              xml.element "apps:property", name: "sizeUnit", value: "s_smb"
            end
          end
        end
      end
    end
  end
end
