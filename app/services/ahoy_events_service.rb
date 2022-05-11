class AhoyEventsService
  attr_accessor :ahoy

  def initialize(ahoy_instance)
    @ahoy = ahoy_instance
  end

  def track_sign_up
    @ahoy.track "Sign up"
  end

  def download_cv
    @ahoy.track "download_cv"
  end
end
