require 'byebug'

RSpec.describe 'a random double' do
  it 'only allows defined methods to be invoked' do
    stuntman = double('Mr. Loid Forger')
    allow(stuntman).to receive(:save_anya)
                   .and_return('are you okay?')

    expect(stuntman.save_anya).to eq('are you okay?')
  end
end

RSpec.describe 'doubles' do
  it "tests the student's knowledge of the course's content" do
    db = double('Database Connection')

    allow(db).to receive(:connect)
             .and_return(true)
    allow(db).to receive(:disconnect)
             .and_return("Goodbye")
    expect(db.connect).to be_truthy
    expect(db.disconnect).to eq('Goodbye')

    fs = double('File System')

    allow(fs).to receive(:read)
             .and_return('Romeo and Juliet')
    allow(fs).to receive(:write)
             .and_return(false)
    expect(fs.read).to eq('Romeo and Juliet')
    expect(fs.write).to be_falsey
  end
end