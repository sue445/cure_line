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

    it { should eq "https://timeline.line.me/post/_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE/1152127900305060448" }
  end

  describe "#text" do
    subject { post.text }

    let(:text) do
      <<~EOS.strip
        プリキュアになってから、さあやとほまれとますます仲良くなれて、
        超うれしー！！＼(^o^)／
        今日はビューティーハリーで、お互いに洋服をコーディネイトし合ったんだ～。
        
        さあやは、大人っぽいデザインのスカートがめっちゃ似合ってた！
        う～ん、絵のモデルさんになれそうなくらい素敵！( *´艸｀)
        
        ほまれはオシャレ上級者しか着こなせないような、最先端のオールインワンがぴったり！
        背が高くて、足が長い人はいいな～、うぅ……(T_T)
        
        はぐたんはくまさんの耳がついたフードをかぶって……。
        きゃ、きゃ、きゃわたん～～～～(・´з`・)
        拝みたくなる可愛さでした♡
        
        で……私は！？私は何が似合うかな！？
        えっ……ハリーおすすめのどデカイ虎の絵が描いてあるトレーナー！！？
        みんな、似合ってるって言ってくれるけど……お腹抱えて笑ってるじゃん！！ヽ(`Д´)ﾉﾌﾟﾝﾌﾟﾝ
        
        う～ん、でも言われてみれば、たしかに似合ってるような……。
        これを着こなせるって、逆にすごいかも☆(^ε^)
        はぁ～、今日もいい一日でした！
      EOS
    end

    it { should eq text }
  end

  describe "#created_time" do
    subject { post.created_time }

    it { should eq Time.at(1521279003) }
  end

  describe "#updated_time" do
    subject { post.created_time }

    it { should eq Time.at(1521279003) }
  end

  describe "#photo_urls" do
    subject { post.photo_urls }

    its(:count) { should eq 1 }
    its([0]) { should eq "https://obs.line-scdn.net/h5XG4_2KndnZXIWV4GHdxDwZTY0ZUe34iR3snQghNNkNUfSx0Qy4lRF9PPERUeS8iQy9gFwtOYENTfg" }

    context "When photo is not found" do
      let(:feed_index) { 5 }

      it { should eq [] }
    end
  end
end
