require "rails_helper"

RSpec.describe Article, type: :model do
  def article_params
    {
      title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
      status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00",
      code: "bKzXCO", url: "rails.com", total_comments: 10
    }
  end

  def comment_params
    {
      commenter: "Yoshitaka Edo",
      body: "It is a very touching article",
      email: "edo_yosh9k@gmail.com",
      email_confirmation: "edo_yosh9k@gmail.com",
      status: Article.status_public
    }
  end

  context 'valid attributes' do
    it "is valid with valid attributes" do
      article = Article.new(article_params)
      article.save
      expect(article).to be_valid
    end
  end

  context 'start_hour not specified' do
    it "throws error" do
      article = Article.new(article_params)
      article.start_hour = nil
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Start hour can't be blank")
    end
  end

  context 'start_hour is greater than end_hour' do
    it "throws error" do
      article = Article.new(article_params)
      article.start_hour = "20:00:00"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to include("Start hour must be less than or equal to")
    end
  end

  context 'url has www' do
    it "throws error" do
      article = Article.new(article_params)
      article.url = "www.yahoo.us"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Url is reserved")
    end
  end

  context 'article_code contains number' do
    it "throws error" do
      article = Article.new(article_params)
      article.code = "article_001"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Code only allows letters")
    end
  end

  context 'total_comments contains letter' do
    it "throws error" do
      article = Article.new(article_params)
      article.total_comments = "20 comments"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Total comments is not a number")
    end
  end

  context 'title is found not unique' do
    it "throws error" do
      article = Article.new(article_params)
      article.save

      article_2 = Article.new(article_params)
      article_2.save

      expect(article_2.invalid?).to be_truthy
      expect(article_2.errors.full_messages[0]).to eq("Title should happen once per url")
    end

    it "is valid" do
      article = Article.new(article_params)
      article.save

      article_2 = Article.new(article_params)
      article_2.url = 'go_rails.com'
      article_2.save

      expect(article_2).to be_valid
    end
  end

  context 'body contains banned words' do
    it "throws error" do
      article = Article.new(article_params)
      article.body = "BLACK IS THE WAY"
      article.save

      comment = Comment.new(comment_params)
      comment.body = "It's the black guy"
      comment.article_id = article.id
      comment.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Some words is banned!")

      expect(comment.invalid?).to be_truthy
      expect(comment.errors.full_messages[0]).to eq("Some words is banned!")
    end
  end

  context 'title first character is not uppercase' do
    it "throws error" do
      article = Article.new(article_params)
      article.title = article.title.downcase
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Title must start with upper case")
    end
  end

  context 'total comments is blank' do
    it "is valid" do
      article = Article.new(article_params)
      article.total_comments = nil
      article.save

      expect(article.valid?).to be_truthy
    end
  end

  context 'body has less than 10 characters' do
    it "throws error" do
      article = Article.new(article_params)
      article.body = 'yucks'
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Body must have more than 10 characters")
    end
  end

  context 'commenter is nil when update' do
    it "throws error" do
      article = Article.new(article_params)
      article.save

      it_comment_params = comment_params
      it_comment_params[:commenter] = nil

      comment = Comment.new(it_comment_params)
      # before update it is expected to be truthy
      comment.article_id = article.id
      byebug
      expect(comment.valid?).to be_truthy

      comment.save

      expect(article.valid?).to be_truthy
      expect(comment.invalid?).to be_truthy
      expect(comment.errors.full_messages[0]).to eq("Commenter can't be blank")
    end
  end

  context 'end_hour is blank, then value is assigned' do
    it "throws error first, then valid" do
      article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                            status: Article.status_public, start_hour: "08:00:00",
                            code: "bKzXCO", url: "rails.com", total_comments: 10)

      expect { article.valid? }.to raise_error(ActiveModel::StrictValidationFailed, "End hour can't be blank")

      article.end_hour = "17:00:00"
      article.save

      expect(article.valid?).to be_truthy
    end
  end

  context 'body has counter' do
    it "throws error" do
      article = Article.new(article_params)
      article.save

      comment = Comment.new(comment_params)
      comment.article_id = article.id
      comment.save

      expect(article.valid?).to be_truthy
      expect(comment.invalid?).to be_truthy
      expect(comment.errors.full_messages[0]).to eq("Body characters count can't be blank")

      comment.body_characters_count = comment.body.length
      comment.save
      expect(comment.valid?).to be_truthy
    end
  end

  context 'status changed to present' do
    it "throws error" do
      article = Article.new(article_params)
      article.save

      comment = Comment.new(comment_params)
      comment.article_id = article.id
      comment.status = 'private'
      comment.body_characters_count = comment.body.length
      comment.save

      expect(article.valid?).to be_truthy
      expect(comment.valid?).to be_truthy

      comment.status = 'archived'
      comment.save

      expect(comment.invalid?).to be_truthy
      expect(comment.errors.full_messages[0]).to eq("Body is too short (minimum is 40 characters)")
    end
  end
end
