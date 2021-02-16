# copyright: 2021, Urs Voegele

title "check docker images"

# check docker images
control "chartmuseum-1.0" do                # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "check if chartmuseum image exist"  # A human-readable title
  desc "check chartmuseum image"
  describe docker_container(name: 'chartmuseum') do
    it { should exist }
    it { should be_running }
  end
end
