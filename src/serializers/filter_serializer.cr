require "xml"

class FilterSerializer < BaseSerializer
  def self.for_collection(filters : FilterQuery)
    XML.build(indent: "  ") do |xml|
      xml.element "feed", xmlns: "http://www.w3.org/2005/Atom", "xmlns:apps": "http://schemas.google.com/apps/2006" do
        xml.element "title" { xml.text Application.settings.name }

        filters.each do |filter|
          if filter.variants.empty?
            render_filter_xml(xml, filter)
          else
            render_filter_variant_xml(xml, filter)
          end
        end
      end
    end
  end

  def self.render_filter_variant_xml(xml : XML::Builder, filter : Filter)
    filter.variants.each_with_index(1) do |variant, index|
      xml.element "entry" do
        xml.element "category", term: "filter"
        xml.element "title" { xml.text "#{filter.name} #{index}/#{filter.variants.size}" }
        xml.element "apps:property", name: "hasTheWord", value: variant.perform_substitutions(filter.search_query)

        if (value = filter.should_apply_label)
          xml.element "apps:property", name: "label", value: variant.perform_substitutions(value)
        end

        if (value = filter.should_forward_to)
          xml.element "apps:property", name: "forward_to", value: variant.perform_substitutions(value)
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

  def self.render_filter_xml(xml : XML::Builder, filter : Filter)
    xml.element "entry" do
      xml.element "category", term: "filter"
      xml.element "title" { xml.text filter.name }
      xml.element "apps:property", name: "hasTheWord", value: filter.search_query

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
