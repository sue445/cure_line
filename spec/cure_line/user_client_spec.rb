RSpec.describe CureLine::UserClient do
  let(:client) { CureLine::UserClient.new(user_id) }

  let(:user_id) { "_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE" }

  before do
    stub_request(:get, "https://timeline.line.me/user/#{user_id}").
      to_return(status: 200, body: fixture("user.html"))
  end

  describe "#info" do
    subject { client.info }

    its(["mid"])        { should eq "_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE" }
    its(["nickname"])   { should eq "プリキュア" }
    its(["pictureUrl"]) { should eq "https://profile.line-scdn.net/0hU_sA3K0gCnBOOCZuQUx1J3J9BB05Fgw4Nl9BQmxsUEZjCU0jewlCFWo-UEk3CRhxdQtCQ20_VRBk" }
    its(["userValid"])  { should eq true }
    its(["writerMid"])  { should eq "_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE" }
  end

  describe "header_url" do
    subject { client.header_url }

    it { should eq "https://obs.line-scdn.net/htzWKFLgwN1RRXiRaCAgwLR0sfTZOB28EU1VjYxs0IWYTAjkDUFViZhhgJjJHUmRR" }
  end

  describe "#posts" do
    subject { client.posts }

    its(:count) { should eq 10 }
  end
end
