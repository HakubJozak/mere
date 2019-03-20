class MergeRequest < OpenStruct
  def to_label
    [ branch, title ].join(' - ')
  end

  def branch
    source_branch
  end

  def author
    User.new(self['author'])
  end

  def short
    "%40s\t%60s" % [ title, branch ]
  end

  def created_at
    Time.parse self['created_at']
  end

  def info
   <<~INFO
   #{branch.red} - #{title} - #{author.name}
   #{tabbed_description}
   INFO
  end

  private
    def tabbed_description
      if description.present?
        description.strip.gsub(/^/,"\t").gray
      else
        "\n"
      end
    end
end
