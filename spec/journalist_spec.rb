require "rails_helper"

RSpec.describe Journalist, type: :model do
  def article_params
    {
      title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
      status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00",
      code: "bKzXCO", url: "rails.com", total_comments: 10
    }
  end

  def journalist_params
    {
      name: "Axel Romero"
    }
  end

  def release_schedule_params
    {
      title: "Release",
      date: Time.zone.now.strftime("%d/%m/%Y")
    }
  end

  def device_params
    {
      device_number: "QG-9002NF"
    }
  end

  def account_params
    {
      username: "account_tester"
    }
  end

  def company_params
    {
      name: "the great runchise"
    }
  end

  def picture_params
    {
      name: "Image001"
    }
  end

  def certificate_params
    {
      title: "Engineer Novice Class"
    }
  end

  context 'when journalist has three articles' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      3.times do |index|
        article = journalist.articles.new(article_params)
        article.url = "#{article.url}/#{index}"
        article.save
        expect(article.valid?).to be_truthy

        release_schedule = article.release_schedules.new(release_schedule_params)
        release_schedule.journalist_id = journalist.id
        release_schedule.save
        expect(release_schedule.valid?).to be_truthy

        expect(journalist.articles.size).to eq(index + 1)
      end

      expect(journalist.valid?).to be_truthy
      expect(Article.all.size).to eq(3)
    end
  end

  context 'when journalist has one account' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      device = Device.new(device_params)
      device.journalist_id = journalist.id
      device.save

      account = Account.new(account_params)
      account.device_id = device.id
      account.save

      expect(journalist.valid?).to be_truthy
      expect(device.valid?).to be_truthy
      expect(account.valid?).to be_truthy
      expect(journalist.account.present?).to be_truthy
    end
  end

  context 'when journalist works in 2 companies' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save
      expect(journalist.valid?).to be_truthy

      2.times do |index|
        company = journalist.companies.new(company_params)
        company.save

        journalist.companies << company
        expect(company.valid?).to be_truthy
      end

      expect(journalist.companies.size).to eq(2)
    end
  end

  context 'when journalist and company owns pictures' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      company = journalist.companies.new(company_params)
      company.save

      journalist.companies << company

      expect(journalist.valid?).to be_truthy
      expect(company.valid?).to be_truthy

      journalist_pic = journalist.pictures.new(picture_params)
      journalist_pic.save
      expect(journalist_pic.valid?).to be_truthy

      company_pic = company.pictures.new(picture_params)
      company_pic.save
      expect(company_pic.valid?).to be_truthy
    end
  end

  context 'when journalist have subordinates' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      subordinate = journalist.subordinates.new(journalist_params)
      subordinate.name = "#{subordinate.name} Subordinate"
      expect(journalist.subordinates.reload).to eq([])
      subordinate.save

      subordinate.name = "Don Bosch"
      expect(journalist.subordinates.reload.first.name).to eq("#{journalist.name} Subordinate")

      expect(subordinate.manager_id).to eq(journalist.id)
      expect(subordinate.manager.name).to eq(journalist.name)
    end
  end

  context 'when journalist have certificate' do
    it "is valid (example 1)" do
      journalist = Journalist.new(journalist_params)
      journalist.save
      expect(journalist.valid?).to be_truthy

      certificate = HistoriesJournalists::Certificate.new(certificate_params)
      certificate.journalist = journalist
      certificate.save
      expect(certificate.valid?).to be_truthy
    end

    it "is valid (example 2)" do
      journalist = Journalist.new(journalist_params)
      journalist.save
      expect(journalist.valid?).to be_truthy

      certificate = journalist.certificates.new(certificate_params)
      certificate.save
      expect(certificate.valid?).to be_truthy
    end
  end

  context '(inverse) when journalist have subordinates' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      subordinate = journalist.subordinates.new(journalist_params)
      subordinate.name = "#{subordinate.name} Subordinate"
      subordinate.save

      journalist.name = "Don Bosch"
      expect(journalist.name).to eq(subordinate.manager.name)
    end
  end

  context 'belongs to journalist' do
    it "is valid" do
      certificate = HistoriesJournalists::Certificate.new(certificate_params)
      certificate.save
      expect(certificate.invalid?).to be_truthy

      certificate.build_journalist(journalist_params)
      expect(certificate.journalist_changed?).to be_truthy

      certificate.save
      expect(certificate.journalist_previously_changed?).to be_truthy
    end
  end

  context 'journalist updated_at updated when certificate updates' do
    it "is valid" do
      certificate = HistoriesJournalists::Certificate.new(certificate_params)
      certificate.save
      expect(certificate.invalid?).to be_truthy
      certificate_beginning_updated_at = certificate.updated_at
      sleep(1)

      certificate.build_journalist(journalist_params)
      expect(certificate.journalist_changed?).to be_truthy

      certificate.save
      expect(certificate.updated_at).to_not eq(certificate_beginning_updated_at)
      expect(certificate.journalist_previously_changed?).to be_truthy
    end
  end

  context 'when picture is jpeg' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      picture_jpg = PictureJpg.new(picture_params)
      picture_jpg.imageable = journalist
      picture_jpg.save

      expect(picture_jpg.valid?).to be_truthy
      expect(picture_jpg.type).to eq('PictureJpg')
    end
  end

  context 'using query find' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      picture_jpg = PictureJpg.new(picture_params)
      picture_jpg.imageable = journalist
      picture_jpg.save

      expect(picture_jpg.valid?).to be_truthy
      expect(picture_jpg.type).to eq('PictureJpg')
      byebug
    end
  end
end
