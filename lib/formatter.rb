class Formatter
  def initialize(colors: true)
    @colors = colors
  end

  def print_mrs(reqs)
    st = reqs.map(&:title).map(&:size).max
    sb = reqs.map(&:branch).map(&:size).max

    reqs.each do |mr|
      date = mr.created_at.to_date.to_s
      branch = mr.branch.ljust(sb).red
      title  = mr.title.ljust(st)

      puts "%8s %3s %#{sb + 1}s - %#{st + 1}s | %s" % [ date.yellow, mr.iid, branch, title , mr.web_url ]
    end    
  end
  

end
