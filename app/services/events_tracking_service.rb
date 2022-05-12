class EventsTrackingService
  attr_accessor :ahoy

  def initialize(ahoy_instance)
    @ahoy = ahoy_instance
  end

  def sign_up
    @ahoy.track "Sign up"
  end

  def sign_in
    @ahoy.track "Sign in"
  end

  def create_cv
    @ahoy.track "Create Cv"
  end

  def download_cv
    @ahoy.track "Download Cv"
  end
end
