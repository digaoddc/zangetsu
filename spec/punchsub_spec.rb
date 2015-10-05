require File.dirname(__FILE__) + '/spec_helper'

describe Zangetsu::Drivers::Punchsub do
  let(:project_list) { described_class.projects }

  describe ".projects" do
    let(:response_json)     { "[[\"195\",\"Accel World\",\"A\",\"\",\"Action, Novel\",\"hd\",\"25/24\",\"21/09/2012\",\"Complete\",\"1348275994\",\"0\"]]" }
    let(:expected_response) { [{:id=>"195", :name=>"Accel World", :episodes_number=>"25/24", :genres=>["Action", " Novel"], :status=>"Complete", :quality=>"hd", :last_update=>"21/09/2012"}] }

    before do
      allow(RestClient).to receive(:get) { response_json }
    end

    it "list all projects" do
      expect(project_list).to eq(expected_response)
    end
  end
end