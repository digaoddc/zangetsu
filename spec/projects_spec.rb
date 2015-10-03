require File.dirname(__FILE__) + '/spec_helper'

describe Zangetsu::Projects do
  let(:projects_instance) { described_class.new }

  describe "#fetch" do
    let(:response_json) { "[[\"195\",\"Accel World\",\"A\",\"\",\"Action, Novel\",\"hd\",\"25/24\",\"21/09/2012\",\"Complete\",\"1348275994\",\"0\"]]" }
    # subject { projects_instance.fetch }

    before do
      allow(RestClient).to receive(:get) { response_json }
    end

    it "list all projects" do
      expect(projects_instance.fetch).to eq([{:id=>"195", :name=>"Accel World", :episodes=>"25/24", :genres=>["Action", " Novel"], :status=>"Complete", :quality=>"hd", :last_update=>"21/09/2012"}])
    end
  end
end