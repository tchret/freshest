module CrispHelper
  def crisp_average(source, user)
    Rails.env.production? ? crisp = ((Time.now.to_i - source.last_post_at.to_time.to_i) / 60) > user.crisp_average : ""
    return crisp
  end
end
