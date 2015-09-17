require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  it "returns correct class for bootstrap" do
    expect(helper.bootstrap_class_for("notice")).to eq("alert-info")
  end

end
