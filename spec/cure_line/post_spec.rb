RSpec.describe CureLine::Post do
  let(:post) { CureLine::Post.new(feed_hash) }

  let(:feed_hash)  { preloaded_state["userHome"]["feeds"][feed_index] }
  let(:feed_index) { 0 }

  let(:preloaded_state) do
    CureLine::Mash.new(JSON.parse(fixture("user.json")))
  end

  describe "#nickname" do
    subject { post.nickname }

    it { should eq "プリキュア" }
  end

  describe "#picture_url" do
    subject { post.picture_url }

    it { should eq "https://profile.line-scdn.net/0hU_sA3K0gCnBOOCZuQUx1J3J9BB05Fgw4Nl9BQmxsUEZjCU0jewlCFWo-UEk3CRhxdQtCQ20_VRBk" }
  end

  describe "#post_url" do
    subject { post.post_url }

    it { should eq "https://timeline.line.me/post/_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE/1153518940605069991" }
  end

  describe "#text" do
    subject { post.text }

    let(:text) do
      <<~EOS.strip
        夏休み、めっちゃ楽しい～～～～ヾ(≧▽≦)ﾉいえーい！

        みんなとの想い出がいっぱいできて、最高の夏だね！！
        残りの夏休みも思いっきりエンジョイしよう……え、夏休みの宿題？？
        
        めちょっく！！まだ全然終わってないんだった～～！！Σ(ﾟдﾟlll)よーし、みんなで集まって勉強会しよーう！
        って、ええ！？さあやもほまれも、えみるもルールーもほとんど終わってる！？Σ(ﾟДﾟ)
        
        う、うそでしょ……。終わってないの私だけ～！？(ノД`)・゜・。
        はう～、頑張らなくちゃ……。ん？はぐたん、手伝ってくれるの？
        
        「がんばえ～(^▽^)」
        
        はぐたん、応援ありがとう！はぐたんの応援があれば頑張れる！！
        フレフレ私ー！！
      EOS
    end

    it { should eq text }
  end

  describe "#created_time" do
    subject { post.created_time }

    it { should eq Time.at(1535189406) }
  end

  describe "#updated_time" do
    subject { post.created_time }

    it { should eq Time.at(1535189406) }
  end

  describe "#photo_urls" do
    subject { post.photo_urls }

    its(:count) { should eq 1 }
    its([0]) { should eq "https://obs.line-scdn.net/hYfs8Zv3PGkhjLQlGLHsdMTJfWilicBVLci5Ie2NIWykwc0QaIC8cJmxJXXFkJkZKdycMJjgTX3pmcg" }
  end
end
