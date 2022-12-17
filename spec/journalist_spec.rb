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

      journalist_2 = Journalist.new(journalist_params)
      journalist_2.save

      expect(journalist.valid?).to be_truthy
      expect(journalist_2.valid?).to be_truthy

      journalists = Journalist.find([journalist.id, journalist_2.id])
      expect(journalists.size).to eq(2)
      expect(journalists.class).to eq(Array)
    end

    it "is not valid" do
      journalists = Journalist.find([1, 2])
    rescue ActiveRecord::RecordNotFound
      expect(journalists.present?).to be_falsey
    end
  end

  context 'using query take' do
    it "is valid when take 1" do
      10.times do
        journalist = Journalist.new(journalist_params)
        journalist.save
      end

      journalist_take = Journalist.take
      expect(journalist_take).to eq(Journalist.first)
    end

    it "is not valid" do
      journalists = Journalist.take!
    rescue ActiveRecord::RecordNotFound
      expect(journalists.present?).to be_falsey
    end
  end

  context 'using query last' do
    it "is valid when using last" do
      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.save
      end

      journalist_last = Journalist.last
      expect(journalist_last.name).to eq("Axel Romero 9")
    end

    it "is valid when using last and ordered by name" do
      10.downto(1) do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.save
      end

      journalist_last = Journalist.order(:name).last
      expect(journalist_last.name).to eq("Axel Romero 9")
    end

    it "is not valid" do
      journalists = Journalist.last!
    rescue ActiveRecord::RecordNotFound
      expect(journalists.present?).to be_falsey
    end
  end

  context 'using query like' do
    it "is valid when using sanitize_sql_like" do
      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.save
      end

      journalists = Journalist.where("name like ?", '%' + Journalist.sanitize_sql_like('Axel Romero') + '%')
      expect(journalists.size).to eq(10)
    end
  end

  context 'using condition hash range' do
    it "is valid when using hash range" do
      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.save
      end

      journalists = Journalist.where(id: 2..5)
      expect(journalists.first.id).to eq(2)
      expect(journalists.last.id).to eq(5)
      expect(journalists.size).to eq(4)
    end

    it "is valid when using hash range of salary" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save

        salary += 10_000_000
      end

      journalists = Journalist.where(salary: 50_000_000..80_000_000)
      expect(journalists.first.salary).to eq(50_000_000)
      expect(journalists.last.salary).to eq(80_000_000)
      expect(journalists.size).to eq(4)
    end
  end

  context 'using condition hash range greater than' do
    it "is valid when using hash range" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save

        salary += 10_000_000
      end

      journalists = Journalist.where(salary: 50_000_000..)
      expect(journalists.first.salary).to eq(50_000_000)
      expect(journalists.size).to eq(8)
    end
  end

  context 'using condition hash range less than' do
    it "is valid when using hash range" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save

        salary += 10_000_000
      end

      journalists = Journalist.where(salary: ..50_000_000)
      expect(journalists.first.salary).to eq(30_000_000)
      expect(journalists.size).to eq(3)
    end
  end

  context 'using condition hash IN' do
    it "is valid when using hash IN" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save

        salary += 10_000_000
      end

      journalists = Journalist.where(salary: [40_000_000, 60_000_000])
      expect(journalists.size).to eq(2)
    end
  end

  context 'using select' do
    it "is valid when using select" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save
        expect(journalist.present?).to be_truthy

        salary += 10_000_000
      end

      journalists = Journalist.select(:name, :salary).where(salary: [40_000_000, 60_000_000])
      expect(journalists.map(&:name)).to eq(['Axel Romero 1', 'Axel Romero 3'])
    end
  end

  context 'using limit' do
    it "is valid when using limit" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save
        expect(journalist.present?).to be_truthy

        salary += 10_000_000
      end

      journalists = Journalist.select(:name, :salary).where(salary: 50_000_000..).limit(3)
      expect(journalists.map(&:name)).to eq(['Axel Romero 2', 'Axel Romero 3', 'Axel Romero 4'])
    end
  end

  context 'using limit and offset' do
    it "is valid when using limit and offset" do
      salary = 30_000_000

      10.times do |index|
        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{index}"
        journalist.salary = salary
        journalist.save
        expect(journalist.present?).to be_truthy

        salary += 10_000_000
      end

      journalists = Journalist.select(:name, :salary).where(salary: 50_000_000..).limit(3).offset(2)
      expect(journalists.map(&:name)).to eq(['Axel Romero 4', 'Axel Romero 5', 'Axel Romero 6'])
    end
  end

  context 'using group' do
    it "is valid when using group count" do
      salary = 30_000_000

      10.times do |index|
        is_odd_or_even = index % 2 == 0 ? 'odd' : 'even'

        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{is_odd_or_even}"
        journalist.salary = salary
        journalist.save
        expect(journalist.present?).to be_truthy

        salary += 10_000_000
      end

      journalists = Journalist.group(:name).count
      expect(journalists['Axel Romero odd']).to eq(5)
      expect(journalists['Axel Romero even']).to eq(5)
    end
  end

  context 'using having' do
    it "is valid when using having" do
      salary = 30_000_000

      10.times do |index|
        is_odd_or_even = index % 2 == 0 ? 'odd' : 'even'

        journalist = Journalist.new(journalist_params)
        journalist.name = "#{journalist.name} #{is_odd_or_even}"
        journalist.salary = salary
        journalist.save
        expect(journalist.present?).to be_truthy

        salary += 10_000_000
      end

      journalists = Journalist.select(:name, :salary)
                              .group(:name, :salary)
                              .having('salary > ?', 60_000_000)
                              .order(salary: :desc)

      expect(journalists.map(&:name).tally['Axel Romero odd']).to eq(3)
      expect(journalists.map(&:name).tally['Axel Romero even']).to eq(3)
      expect(journalists.first.salary).to eq(0.12e9)
      expect(journalists.last.salary).to eq(0.7e8)
    end
  end
end
