class Formatter
  def initialize(colors: true)
    @colors = colors
  end

  def print_mrs(reqs)
    st = reqs.map(&:title).map(&:size).max
    sb = reqs.map(&:branch).map(&:size).max

    reqs.map do |mr|
      date = mr.created_at.to_date.to_s
      branch = mr.branch.ljust(sb).red
      title  = mr.title.ljust(st)

      "%3s %8s %#{sb + 1}s - %#{st + 1}s | %s" % [ mr.iid, date.yellow, branch, title , mr.web_url ]
    end.join("\n")
  end
  

end
