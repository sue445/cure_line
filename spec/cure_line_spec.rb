RSpec.describe CureLine do
  describe ".user" do
    subject { CureLine.user(user_id) }

    let(:user_id) { "_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE" }

    before do
      stub_request(:get, "https://timeline.line.me/user/#{user_id}").
        to_return(status: 200, body: fixture("user.html"))
    end

    it { should be_an_instance_of CureLine::User }
  end
end
