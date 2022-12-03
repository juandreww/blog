require "rails_helper"

RSpec.describe Article, type: :model do
  it "is valid with valid attributes" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: "public")
    article.save
    expect(article).to be_valid
  end
end
