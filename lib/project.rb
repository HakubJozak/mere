class Project < OpenStruct
  def to_label
    [ id, name ].join(' - ')
  end
end
