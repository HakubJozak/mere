class Gitlab

  attr_reader :http

  def initialize
    @http = HTTP
              .persistent("https://gitlab.com")
              .headers('Private-Token' => ENV['GITLAB_TOKEN'])
    yield(self)
    @http.close
  end

  def projects
    r = @http.get('/api/v4/projects', params: { owned: true })
    JSON.parse(r.to_s).map do |p|
      puts Project.new(p).to_label
    end
  end

  def kdm_id
    9028873
  end

  def merge_requests
    r = @http.get("/api/v4/projects/#{kdm_id}/merge_requests",
                  params: { state: 'opened'})

    reqs = JSON.parse(r.to_s).map do |json|
      MergeRequest.new(json)
    end

    st = reqs.map(&:title).map(&:size).max
    sb = reqs.map(&:branch).map(&:size).max

    reqs.each do |mr|
      date = mr.created_at.to_date.to_s

      puts "%8s %3s %#{sb + 1}s - %#{st + 1}s" % [ date.yellow, mr.iid, mr.branch.ljust(sb).red, mr.title.ljust(st) ]
    end

  end

end
