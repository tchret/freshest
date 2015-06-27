module ApplicationHelper
  def global_crisp_avge
    avge = 0
    sum = 0
    Source.all.each do |source|
      time = ((Time.now.to_i - source.last_post_at.to_time.to_i) / 60)
      sum += time
    end
    if sum / Source.all.count > 2880
      avge = 2880
    else
      avge = sum / Source.all.count
    end
    avge
  end

end
